import {Component, HostListener, OnInit} from '@angular/core';
import {ActivatedRoute} from "@angular/router";
import {AccessLocation, FilterSchema, StudyFilterConfig, StudyPageConfig, DicomMode} from "../../interfaces";
import {StudyService} from "./study.service";
import {Observable} from "rxjs/Observable";
import {j4care} from "../../helpers/j4care.service";
import {Aet} from "../../models/aet";
import {PermissionService} from "../../helpers/permissions/permission.service";
import {AppService} from "../../app.service";
import { retry } from 'rxjs/operators';
import {Globalvar} from "../../constants/globalvar";
import {unescape} from "querystring";
import {animate, state, style, transition, trigger} from "@angular/animations";
import {HttpErrorHandler} from "../../helpers/http-error-handler";
import {PatientDicom} from "../../models/patient-dicom";
import {StudyDicom} from "../../models/study-dicom";
import * as _  from "lodash";
import {LoadingBarService} from "@ngx-loading-bar/core";
import {DicomTableSchema, TableSchemaConfig} from "../../helpers/dicom-studies-table/dicom-studies-table.interfaces";
import {SeriesDicom} from "../../models/series-dicom";
import {InstanceDicom} from "../../models/instance-dicom";
import {WadoQueryParams} from "./wado-wuery-params";
import {GSPSQueryParams} from "../../models/gsps-query-params";


@Component({
    selector: 'app-study',
    templateUrl: './study.component.html',
    styleUrls: ['./study.component.scss'],
    animations:[
        trigger("showHide",[
            state("show",style({
                padding:"*",
                height:'*',
                opacity:1
            })),
            state("hide",style({
                padding:"0",
                opacity:0,
                height:'0px',
                margin:"0"
            })),
            transition("show => hide",[
                animate('0.4s')
            ]),
            transition("hide => show",[
                animate('0.3s')
            ])
        ])
    ]
})
export class StudyComponent implements OnInit {

    test = Globalvar.ORDERBY;

    isOpen = true;
    testToggle(){
        this.isOpen = !this.isOpen;
    }
    studyConfig:StudyPageConfig = {
        tab:"study",
        accessLocation:"internal"
    };

    patientAttributes;

    private _filter:StudyFilterConfig = {
        filterSchemaMain:{
            lineLength:undefined,
            schema:[]
        },
        filterSchemaExpand:{
            lineLength:2,
            schema:[]
        },
        filterModel:{
            limit:20,
            offset:0
        },
        expand:false,
        quantityText:{
            count:"COUNT",
            size:"SIZE"
        }
    };

    get filter(): StudyFilterConfig {
        return this._filter;
    }

    set filter(value: StudyFilterConfig) {
        this.tableParam.config.offset = value.filterModel.offset;
        this._filter = value;
    }

    applicationEntities = {
        aes:{
          external:[],
          internal:[]
        },
        aets:{
          external:[],
          internal:[]
        },
        aetsAreSet:false
    };

    tableParam:{tableSchema:DicomTableSchema,config:TableSchemaConfig} = {
        tableSchema:Globalvar.PATIENT_STUDIES_TABLE_SCHEMA(this, this.actions),
        config:{
            offset:0
        }
    };
    constructor(
        private route:ActivatedRoute,
        private service:StudyService,
        private permissionService:PermissionService,
        private appService:AppService,
        private httpErrorHandler:HttpErrorHandler,
        private cfpLoadingBar:LoadingBarService
    ) { }

    ngOnInit() {
        console.log("aet",this.applicationEntities);
        this.getPatientAttributeFilters();
        this.route.params.subscribe(params => {
          this.studyConfig.tab = params.tab;
          this.getApplicationEntities();
        });
    }
    testShow = true;
    fixedHeader = false;
    patients:PatientDicom[] = [];
    moreStudies:boolean = false;

    @HostListener("window:scroll", [])
    onWindowScroll(e) {
        let html = document.documentElement;
        if(html.scrollTop > 63){
            this.fixedHeader = true;
            this.testShow = false;
            this.filter.expand = false;
        }else{
            this.fixedHeader = false;
            this.testShow = true;
        }

    }

    actions(id, model){
        console.log("id",id);
        console.log("model",model);
        if(id.action === "toggle_series"){
            if(!model.series){
                this.getSeries(model);
            }else{
                model.showSeries = !model.showSeries;
            }

        }
        if(id.action === "toggle_instances"){
            if(!model.instances){
                this.getInstances(model);
            }else{
                model.showInstances = !model.showInstances;
            }

        }
    }
    search(mode?:('next'|'prev'|'current')){
        if (this._filter.filterModel.aet){
            let callingAet = new Aet(this._filter.filterModel.aet);
            let filters = _.clone(this._filter.filterModel);
            if(filters.limit){
                filters.limit++;
            }
            delete filters.aet;
            if(!mode || mode === "current"){
                filters.offset = 0;
                this.getStudies(filters, callingAet);
            }else{
                if(mode === "next" && this.moreStudies){
                    filters.offset = filters.offset + this._filter.filterModel.limit;
                    this.getStudies(filters, callingAet);
                }
                if(mode === "prev" && filters.offset > 0){
                    filters.offset = filters.offset - this._filter.filterModel.offset;
                    this.getStudies(filters, callingAet);
                }
            }
        }else{
            this.appService.showError("Calling AET is missing!");
        }
    }

    getStudies(filters, callingAet){
        this.cfpLoadingBar.start();
        this.service.getStudies(callingAet, filters)
            .subscribe(res => {
                this.patients = [];
                if(res){
                    let index = 0;
                    let patient: PatientDicom;
                    let study: StudyDicom;
                    let patAttrs;
                    let tags = this.patientAttributes.dcmTag;

                    while (tags && (tags[index] < '00201200')) {
                        index++;
                    }
                    tags.splice(index, 0, '00201200');
                    tags.push('77770010', '77771010', '77771011', '77771012', '77771013', '77771014');

                    res.forEach((studyAttrs, index) => {
                        patAttrs = {};
                        this.service.extractAttrs(studyAttrs, tags, patAttrs);
                        if (!(patient && this.service.equalsIgnoreSpecificCharacterSet(patient.attrs, patAttrs))) {
                            patient = new PatientDicom(patAttrs, [], false, true);
                            this.patients.push(patient);
                        }
                        study = new StudyDicom(studyAttrs, patient, this._filter.filterModel.offset + index);
                        patient.studies.push(study);
                    });
                    if (this.moreStudies = (res.length > this._filter.filterModel.limit)) {
                        patient.studies.pop();
                        if (patient.studies.length === 0) {
                            this.patients.pop();
                        }
                        // this.studies.pop();
                    }
                }else{
                    this.appService.showMsg("No Studies found!");
                }
                this._filter.filterModel.offset = filters.offset;
                this.cfpLoadingBar.complete();
                console.log("this.patients", this.patients);
            }, err => {
                j4care.log("Something went wrong on search", err);
                this.httpErrorHandler.handleError(err);
                this.cfpLoadingBar.complete();
            });
    }
    getSeries(study:StudyDicom){
        console.log('in query sersies study=', study);
        this.cfpLoadingBar.start();
        if (study.offset < 0) study.offset = 0;
        let callingAet = new Aet(this._filter.filterModel.aet);
        let filters = _.clone(this._filter.filterModel);
        if(filters.limit){
            filters.limit++;
        }
        delete filters.aet;
        filters["orderby"] = 'SeriesNumber';
        this.service.getSeries(callingAet,study.attrs['0020000D'].Value[0], filters)
            .subscribe((res)=>{
            if (res){
                if (res.length === 0){
                    this.appService.setMessage( {
                        'title': 'Info',
                        'text': 'No matching series found!',
                        'status': 'info'
                    });
                    console.log('in reslength 0');
                }else{

                    study.series = res.map((attrs, index) =>{
                        return new SeriesDicom(study, attrs, study.offset + index);
                    });
                    if (study.moreSeries = (study.series.length > this._filter.filterModel.limit)) {
                        study.series.pop();
                    }
                    console.log("study",study);
                    console.log("patients",this.patients);
                    // StudiesService.trim(this);
                    study.showSeries = true;
                }
                this.cfpLoadingBar.complete();
            }else{
                this.appService.setMessage( {
                    'title': 'Info',
                    'text': 'No matching series found!',
                    'status': 'info'
                });
            }
        },(err)=>{
                j4care.log("Something went wrong on search", err);
                this.httpErrorHandler.handleError(err);
                this.cfpLoadingBar.complete();
        });
    }

    getInstances(series:SeriesDicom){
        console.log('in query Instances serie=', series);
        this.cfpLoadingBar.start();
        if (series.offset < 0) series.offset = 0;
        let callingAet = new Aet(this._filter.filterModel.aet);
        let filters = _.clone(this._filter.filterModel);
        if(filters.limit){
            filters.limit++;
        }
        delete filters.aet;
        filters["orderby"] = 'InstanceNumber';
        this.service.getInstances(callingAet,series.attrs['0020000D'].Value[0], series.attrs['0020000E'].Value[0], filters)
            .subscribe((res)=>{
            if (res){
                series.instances = res.map((attrs, index) => {
                    let numberOfFrames = j4care.valueOf(attrs['00280008']),
                        gspsQueryParams:GSPSQueryParams[] = this.service.createGSPSQueryParams(attrs),
                        video = this.service.isVideo(attrs),
                        image = this.service.isImage(attrs);
                    return new InstanceDicom(
                        series,
                        series.offset + index,
                        attrs,
                        new WadoQueryParams(attrs['0020000D'].Value[0],attrs['0020000E'].Value[0], attrs['00080018'].Value[0]),
                        video,
                        image,
                        numberOfFrames,
                        gspsQueryParams,
                        this.service.createArray(video || numberOfFrames || gspsQueryParams.length || 1),
                        1
                    )
                });
                console.log(series);
                console.log(this.patients);
                series.showInstances = true;
            }else{
                series.instances = [];
                if (series.moreInstances = (series.instances.length > this._filter.filterModel.limit)) {
                    series.instances.pop();
                    this.appService.setMessage( {
                        'title': 'Info',
                        'text': 'No matching Instancess found!',
                        'status': 'info'
                    });
                }
            }
            this.cfpLoadingBar.complete();
        },(err)=>{
                j4care.log("Something went wrong on search", err);
                this.httpErrorHandler.handleError(err);
                this.cfpLoadingBar.complete();
        });
    }
    filterChanged(){

    }

    setSchema(){
        this._filter.filterSchemaMain.lineLength = undefined;
        this._filter.filterSchemaExpand.lineLength = undefined;
        // setTimeout(()=>{
            this._filter.filterSchemaMain  = this.service.getFilterSchema(this.studyConfig.tab,  this.applicationEntities.aes[this.studyConfig.accessLocation],this._filter.quantityText,false);
            this._filter.filterSchemaExpand  = this.service.getFilterSchema(this.studyConfig.tab, this.applicationEntities.aes[this.studyConfig.accessLocation],this._filter.quantityText,true);
        // },0);
    }

    accessLocationChange(e){
        console.log("e",e.value);
        console.log("accessLocation",this.studyConfig.accessLocation);
        this.setSchema();
    }

    getPatientAttributeFilters(){
        this.service.getAttributeFilter().subscribe(patientAttributes=>{
            this.patientAttributes = patientAttributes;
        },err=>{
            j4care.log("Something went wrong on getting Patient Attributes",err);
            this.httpErrorHandler.handleError(err);
        });
    }
    getApplicationEntities(){
        if(!this.applicationEntities.aetsAreSet){
            Observable.forkJoin(
                this.service.getAes().map(aes=> aes.map(aet=> new Aet(aet))),
                this.service.getAets().map(aets=> aets.map(aet => new Aet(aet))),
            )
            .subscribe((res)=>{
                [0,1].forEach(i=>{
                    res[i] = j4care.extendAetObjectWithAlias(res[i]);
                    ["external","internal"].forEach(location=>{
                      this.applicationEntities.aes[location] = this.permissionService.filterAetDependingOnUiConfig(res[i],location);
                      this.applicationEntities.aets[location] = this.permissionService.filterAetDependingOnUiConfig(res[i],location);
                      this.applicationEntities.aetsAreSet = true;
                    })
                });
                this.setSchema();
            },(err)=>{
                this.appService.showError("Error getting AETs!");
                j4care.log("error getting aets in Study page",err);
            });
        }else{
            this.setSchema();
        }
    }
}