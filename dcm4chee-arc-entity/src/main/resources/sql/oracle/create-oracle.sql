create sequence code_pk_seq start with 1 increment by 1;
create sequence content_item_pk_seq start with 1 increment by 1;
create sequence dicomattrs_pk_seq start with 1 increment by 1;
create sequence global_subscription_pk_seq start with 1 increment by 1;
create sequence hl7psu_task_pk_seq start with 1 increment by 1;
create sequence ian_task_pk_seq start with 1 increment by 1;
create sequence instance_pk_seq start with 1 increment by 1;
create sequence instance_req_pk_seq start with 1 increment by 1;
create sequence key_value2_pk_seq start with 1 increment by 1;
create sequence location_pk_seq start with 1 increment by 1;
create sequence metadata_pk_seq start with 1 increment by 1;
create sequence mpps_pk_seq start with 1 increment by 1;
create sequence mwl_item_pk_seq start with 1 increment by 1;
create sequence patient_id_pk_seq start with 1 increment by 1;
create sequence patient_pk_seq start with 1 increment by 1;
create sequence person_name_pk_seq start with 1 increment by 1;
create sequence rejected_instance_pk_seq start with 1 increment by 1;
create sequence series_pk_seq start with 1 increment by 1;
create sequence series_query_attrs_pk_seq start with 1 increment by 1;
create sequence series_req_pk_seq start with 1 increment by 1;
create sequence soundex_code_pk_seq start with 1 increment by 1;
create sequence stgcmt_result_pk_seq start with 1 increment by 1;
create sequence study_pk_seq start with 1 increment by 1;
create sequence study_query_attrs_pk_seq start with 1 increment by 1;
create sequence subscription_pk_seq start with 1 increment by 1;
create sequence task_pk_seq start with 1 increment by 1;
create sequence uidmap_pk_seq start with 1 increment by 1;
create sequence ups_pk_seq start with 1 increment by 1;
create sequence ups_request_pk_seq start with 1 increment by 1;
create sequence verify_observer_pk_seq start with 1 increment by 1;
create table code (pk number(19,0) not null, code_meaning varchar2(255 char) not null, code_value varchar2(255 char) not null, code_designator varchar2(255 char) not null, code_version varchar2(255 char) not null, primary key (pk), constraint UKsb4oc9lkns36wswku831c33w6 unique (code_value, code_designator, code_version));
create table content_item (pk number(19,0) not null, rel_type varchar2(255 char) not null, text_value varchar2(255 char), code_fk number(19,0), name_fk number(19,0) not null, instance_fk number(19,0), primary key (pk));
create table dicomattrs (pk number(19,0) not null, attrs blob not null, primary key (pk));
create table global_subscription (pk number(19,0) not null, deletion_lock number(1,0) not null check (deletion_lock in (0,1)), subscriber_aet varchar2(255 char) not null, matchkeys_fk number(19,0) unique, primary key (pk), constraint UK4n26cxir6d3tksb2cd1kd86ch unique (subscriber_aet));
create table hl7psu_task (pk number(19,0) not null, accession_no varchar2(255 char), aet varchar2(255 char) not null, created_time timestamp(6) not null, device_name varchar2(255 char) not null, pps_status number(3,0) check (pps_status between 0 and 2), scheduled_time timestamp(6), series_iuid varchar2(255 char), study_iuid varchar2(255 char), mpps_fk number(19,0) unique, primary key (pk), constraint UK1t3jge4o2fl1byp3y8ljmkb3m unique (study_iuid, pps_status));
create table ian_task (pk number(19,0) not null, calling_aet varchar2(255 char) not null, device_name varchar2(255 char) not null, ian_dests varchar2(255 char) not null, scheduled_time timestamp(6), study_iuid varchar2(255 char), mpps_fk number(19,0) unique, primary key (pk), constraint UKdq88edcjjxh7h92f89y5ueast unique (study_iuid));
create table id_sequence (name varchar2(255 char) not null, next_value number(10,0) not null, version number(19,0), primary key (name));
create table instance (pk number(19,0) not null, availability number(3,0) not null check (availability between 0 and 3), sr_complete varchar2(255 char) not null, content_date varchar2(255 char) not null, content_time varchar2(255 char) not null, created_time timestamp(6) not null, ext_retrieve_aet varchar2(255 char), inst_custom1 varchar2(255 char) not null, inst_custom2 varchar2(255 char) not null, inst_custom3 varchar2(255 char) not null, inst_no number(10,0), num_frames number(10,0), retrieve_aets varchar2(255 char), sop_cuid varchar2(255 char) not null, sop_iuid varchar2(255 char) not null, updated_time timestamp(6) not null, sr_verified varchar2(255 char) not null, version number(19,0), dicomattrs_fk number(19,0) not null unique, srcode_fk number(19,0), series_fk number(19,0) not null, primary key (pk), constraint UK247lgirehl8i2vuanyfjnuyjb unique (series_fk, sop_iuid));
create table instance_req (pk number(19,0) not null, accession_no varchar2(255 char) not null, accno_entity_id varchar2(255 char), accno_entity_uid varchar2(255 char), accno_entity_uid_type varchar2(255 char), req_proc_id varchar2(255 char) not null, req_service nvarchar2(255) not null, sps_id varchar2(255 char) not null, study_iuid varchar2(255 char) not null, req_phys_name_fk number(19,0) unique, instance_fk number(19,0), primary key (pk));
create table key_value2 (pk number(19,0) not null, content_type varchar2(255 char) not null, created_time timestamp(6) not null, key_name varchar2(255 char) not null, updated_time timestamp(6) not null, username varchar2(255 char), key_value varchar2(4000 char) not null, primary key (pk), constraint UK4gq7ksl296rsm6ap9hjrogv3g unique (key_name));
create table location (pk number(19,0) not null, created_time timestamp(6) not null, digest varchar2(255 char), multi_ref number(10,0), object_type number(3,0) not null check (object_type between 0 and 1), object_size number(19,0) not null, status number(3,0) not null check (status between 0 and 17), storage_id varchar2(255 char) not null, storage_path varchar2(255 char) not null, tsuid varchar2(255 char), uidmap_fk number(19,0), instance_fk number(19,0), primary key (pk));
create table metadata (pk number(19,0) not null, created_time timestamp(6) not null, digest varchar2(255 char), object_size number(19,0) not null, status number(3,0) not null check (status between 0 and 9), storage_id varchar2(255 char) not null, storage_path varchar2(255 char) not null, primary key (pk));
create table mpps (pk number(19,0) not null, accession_no varchar2(255 char) not null, accno_entity_id varchar2(255 char), accno_entity_uid varchar2(255 char), accno_entity_uid_type varchar2(255 char), created_time timestamp(6) not null, pps_start_date varchar2(255 char) not null, pps_start_time varchar2(255 char) not null, sop_iuid varchar2(255 char) not null, pps_status number(3,0) not null check (pps_status between 0 and 2), study_iuid varchar2(255 char) not null, updated_time timestamp(6) not null, version number(19,0), dicomattrs_fk number(19,0) not null unique, discreason_code_fk number(19,0), patient_fk number(19,0) not null, primary key (pk), constraint UKcyqglxijg7kebbj6oj821yx4d unique (sop_iuid));
create table mwl_item (pk number(19,0) not null, accession_no varchar2(255 char) not null, accno_entity_id varchar2(255 char), accno_entity_uid varchar2(255 char), accno_entity_uid_type varchar2(255 char), admission_id varchar2(255 char) not null, admid_entity_id varchar2(255 char), admid_entity_uid varchar2(255 char), admid_entity_uid_type varchar2(255 char), created_time timestamp(6) not null, institution varchar2(255 char) not null, department varchar2(255 char) not null, modality varchar2(255 char) not null, req_proc_id varchar2(255 char) not null, sps_id varchar2(255 char) not null, sps_start_date varchar2(255 char) not null, sps_start_time varchar2(255 char) not null, sps_status number(3,0) not null check (sps_status between 0 and 7), study_iuid varchar2(255 char) not null, updated_time timestamp(6) not null, version number(19,0), worklist_label varchar2(255 char) not null, dicomattrs_fk number(19,0) not null unique, inst_code_fk number(19,0), dept_code_fk number(19,0), patient_fk number(19,0) not null, perf_phys_name_fk number(19,0) unique, primary key (pk), constraint UKlerlqlaghhcs0oaj5irux4qig unique (study_iuid, sps_id));
create table patient (pk number(19,0) not null, created_time timestamp(6) not null, failed_verifications number(10,0) not null, num_studies number(10,0) not null, pat_birthdate varchar2(255 char) not null, pat_custom1 varchar2(255 char) not null, pat_custom2 varchar2(255 char) not null, pat_custom3 varchar2(255 char) not null, pat_sex varchar2(255 char) not null, updated_time timestamp(6) not null, verification_status number(3,0) not null check (verification_status between 0 and 4), verification_time timestamp(6), version number(19,0), dicomattrs_fk number(19,0) not null unique, merge_fk number(19,0), pat_name_fk number(19,0) unique, resp_person_fk number(19,0) unique, primary key (pk));
create table patient_demographics (pat_id varchar2(255 char) not null, pat_birthdate varchar2(255 char), pat_name varchar2(255 char), pat_sex varchar2(255 char), primary key (pat_id));
create table patient_id (pk number(19,0) not null, pat_id varchar2(255 char) not null, pat_id_type_code varchar2(255 char), entity_id varchar2(255 char), entity_uid varchar2(255 char), entity_uid_type varchar2(255 char), version number(19,0), patient_fk number(19,0) not null, primary key (pk));
create table person_name (pk number(19,0) not null, alphabetic_name nvarchar2(255), ideographic_name nvarchar2(255), phonetic_name nvarchar2(255), primary key (pk));
create table rejected_instance (pk number(19,0) not null, created_time timestamp(6) not null, series_iuid varchar2(255 char) not null, sop_cuid varchar2(255 char) not null, sop_iuid varchar2(255 char) not null, study_iuid varchar2(255 char) not null, reject_code_fk number(19,0), primary key (pk), constraint UK6liqevdmi0spifxf2vrh18wkp unique (study_iuid, series_iuid, sop_iuid));
create table rel_study_pcode (study_fk number(19,0) not null, pcode_fk number(19,0) not null);
create table rel_task_dicomattrs (task_fk number(19,0) not null, dicomattrs_fk number(19,0) not null unique);
create table rel_ups_perf_code (ups_fk number(19,0) not null, perf_code_fk number(19,0) not null);
create table rel_ups_station_class_code (ups_fk number(19,0) not null, station_class_code_fk number(19,0) not null);
create table rel_ups_station_location_code (ups_fk number(19,0) not null, station_location_code_fk number(19,0) not null);
create table rel_ups_station_name_code (ups_fk number(19,0) not null, station_name_code_fk number(19,0) not null);
create table series (pk number(19,0) not null, body_part varchar2(255 char) not null, completeness number(3,0) not null check (completeness between 0 and 2), compress_failures number(10,0) not null, compress_params varchar2(255 char), compress_time timestamp(6), compress_tsuid varchar2(255 char), created_time timestamp(6) not null, expiration_date varchar2(255 char), expiration_exporter_id varchar2(255 char), expiration_state number(3,0) not null check (expiration_state between 0 and 5), ext_retrieve_aet varchar2(255 char), failed_retrieves number(10,0) not null, stgver_failures number(10,0) not null, inst_purge_state number(3,0) not null check (inst_purge_state between 0 and 2), inst_purge_time timestamp(6), institution nvarchar2(255) not null, department nvarchar2(255) not null, laterality varchar2(255 char) not null, metadata_update_time timestamp(6), metadata_update_failures number(10,0) not null, modality varchar2(255 char) not null, modified_time timestamp(6) not null, pps_cuid varchar2(255 char) not null, pps_iuid varchar2(255 char) not null, pps_start_date varchar2(255 char) not null, pps_start_time varchar2(255 char) not null, receiving_aet varchar2(255 char), receiving_hl7_app varchar2(255 char), receiving_hl7_facility varchar2(255 char), receiving_pres_addr varchar2(255 char), rejection_state number(3,0) not null check (rejection_state between 0 and 3), sending_aet varchar2(255 char), sending_hl7_app varchar2(255 char), sending_hl7_facility varchar2(255 char), sending_pres_addr varchar2(255 char), series_custom1 varchar2(255 char) not null, series_custom2 varchar2(255 char) not null, series_custom3 varchar2(255 char) not null, series_desc varchar2(255 char) not null, series_iuid varchar2(255 char) not null, series_no number(10,0), series_size number(19,0) not null, sop_cuid varchar2(255 char) not null, station_name varchar2(255 char) not null, stgver_time timestamp(6), tsuid varchar2(255 char) not null, updated_time timestamp(6) not null, version number(19,0), dicomattrs_fk number(19,0) not null unique, inst_code_fk number(19,0), dept_code_fk number(19,0), metadata_fk number(19,0) unique, perf_phys_name_fk number(19,0) unique, study_fk number(19,0) not null, primary key (pk), constraint UK83y2fx8cou17h3xggxspgikna unique (study_fk, series_iuid));
create table series_query_attrs (pk number(19,0) not null, availability number(3,0) check (availability between 0 and 3), num_instances number(10,0), retrieve_aets varchar2(255 char), cuids_in_series varchar2(255 char), view_id varchar2(255 char), series_fk number(19,0) not null, primary key (pk), constraint UKt1uhb1suiiqffhsv9eaopeevs unique (view_id, series_fk));
create table series_req (pk number(19,0) not null, accession_no varchar2(255 char) not null, accno_entity_id varchar2(255 char), accno_entity_uid varchar2(255 char), accno_entity_uid_type varchar2(255 char), req_proc_id varchar2(255 char) not null, req_service nvarchar2(255) not null, sps_id varchar2(255 char) not null, study_iuid varchar2(255 char) not null, req_phys_name_fk number(19,0) unique, series_fk number(19,0), primary key (pk));
create table soundex_code (pk number(19,0) not null, sx_code_value varchar2(255 char) not null, sx_pn_comp_part number(10,0) not null, sx_pn_comp number(3,0) not null check (sx_pn_comp between 0 and 4), person_name_fk number(19,0) not null, primary key (pk));
create table sps_station_aet (mwl_item_fk number(19,0) not null, station_aet varchar2(255 char));
create table stgcmt_result (pk number(19,0) not null, batch_id varchar2(255 char), created_time timestamp(6) not null, device_name varchar2(255 char) not null, exporter_id varchar2(255 char), num_failures number(10,0), num_instances number(10,0), series_iuid varchar2(255 char), sop_iuid varchar2(255 char), stgcmt_status number(3,0) not null check (stgcmt_status between 0 and 3), study_iuid varchar2(255 char) not null, task_fk number(19,0), transaction_uid varchar2(255 char) not null, updated_time timestamp(6) not null, primary key (pk), constraint UKey6qpep2qtiwayou7pd0vj22w unique (transaction_uid));
create table study (pk number(19,0) not null, access_control_id varchar2(255 char) not null, access_time timestamp(6) not null, accession_no varchar2(255 char) not null, accno_entity_id varchar2(255 char), accno_entity_uid varchar2(255 char), accno_entity_uid_type varchar2(255 char), admission_id varchar2(255 char) not null, admid_entity_id varchar2(255 char), admid_entity_uid varchar2(255 char), admid_entity_uid_type varchar2(255 char), completeness number(3,0) not null check (completeness between 0 and 2), created_time timestamp(6) not null, expiration_date varchar2(255 char), expiration_exporter_id varchar2(255 char), expiration_state number(3,0) not null check (expiration_state between 0 and 5), ext_retrieve_aet varchar2(255 char) not null, failed_retrieves number(10,0) not null, modified_time timestamp(6) not null, rejection_state number(3,0) not null check (rejection_state between 0 and 3), study_size number(19,0) not null, storage_ids varchar2(255 char), study_custom1 varchar2(255 char) not null, study_custom2 varchar2(255 char) not null, study_custom3 varchar2(255 char) not null, study_date varchar2(255 char) not null, study_desc nvarchar2(255) not null, study_id varchar2(255 char) not null, study_iuid varchar2(255 char) not null, study_time varchar2(255 char) not null, updated_time timestamp(6) not null, version number(19,0), dicomattrs_fk number(19,0) not null unique, patient_fk number(19,0) not null, ref_phys_name_fk number(19,0) unique, primary key (pk), constraint UKpt5qn20x278wb1f7p2t3lcxv unique (study_iuid));
create table study_query_attrs (pk number(19,0) not null, availability number(3,0) check (availability between 0 and 3), mods_in_study varchar2(255 char), num_instances number(10,0), num_series number(10,0), retrieve_aets varchar2(255 char), cuids_in_study varchar2(4000 char), view_id varchar2(255 char), study_fk number(19,0) not null, primary key (pk), constraint UKprn4qt6d42stw0gfi1yce1fap unique (view_id, study_fk));
create table subscription (pk number(19,0) not null, deletion_lock number(1,0) not null check (deletion_lock in (0,1)), subscriber_aet varchar2(255 char) not null, ups_fk number(19,0) not null, primary key (pk), constraint UKco8q5hn46dehb35qsrtwyys96 unique (subscriber_aet, ups_fk));
create table task (pk number(19,0) not null, batch_id varchar2(255 char), check_different number(1,0) check (check_different in (0,1)), check_missing number(1,0) check (check_missing in (0,1)), compare_fields varchar2(255 char), completed number(10,0), created_time timestamp(6) not null, destination_aet varchar2(255 char), device_name varchar2(255 char) not null, different number(10,0) not null, error_comment varchar2(255 char), error_msg varchar2(255 char), exporter_id varchar2(255 char), failed number(10,0), local_aet varchar2(255 char), matches number(10,0) not null, missing number(10,0) not null, modalities varchar2(255 char), num_failures number(10,0) not null, num_instances number(10,0), outcome_msg varchar2(255 char), payload blob, proc_end_time timestamp(6), proc_start_time timestamp(6), query_str varchar2(255 char), queue_name varchar2(255 char) not null, remaining number(10,0), remote_aet varchar2(255 char), rq_uri varchar2(4000 char), rq_host varchar2(255 char), rq_user_id varchar2(255 char), scheduled_time timestamp(6) not null, series_iuid varchar2(255 char), sop_iuid varchar2(255 char), task_status number(3,0) not null check (task_status between 0 and 6), status_code number(10,0), storage_ids varchar2(255 char), stgcmt_policy number(3,0) check (stgcmt_policy between 0 and 5), study_iuid varchar2(255 char), task_type number(3,0) not null check (task_type between 0 and 10), update_location_status number(1,0) check (update_location_status in (0,1)), updated_time timestamp(6) not null, version number(19,0), warning number(10,0) not null, primary key (pk));
create table uidmap (pk number(19,0) not null, uidmap blob not null, primary key (pk));
create table ups (pk number(19,0) not null, admission_id varchar2(255 char) not null, admid_entity_id varchar2(255 char), admid_entity_uid varchar2(255 char), admid_entity_uid_type varchar2(255 char), created_time timestamp(6) not null, expected_end_date_time varchar2(255 char) not null, input_readiness_state number(3,0) not null check (input_readiness_state between 0 and 2), performer_aet varchar2(255 char), ups_state number(3,0) not null check (ups_state between 0 and 3), replaced_iuid varchar2(255 char) not null, expiration_date_time varchar2(255 char) not null, start_date_time varchar2(255 char) not null, transaction_iuid varchar2(255 char), updated_time timestamp(6) not null, ups_iuid varchar2(255 char) not null, ups_label varchar2(255 char) not null, ups_priority number(3,0) not null check (ups_priority between 0 and 2), version number(19,0), worklist_label varchar2(255 char) not null, dicomattrs_fk number(19,0) not null unique, patient_fk number(19,0) not null, ups_code_fk number(19,0), primary key (pk), constraint UKqck03rlxht9myv77sc79a480t unique (ups_iuid));
create table ups_req (pk number(19,0) not null, accession_no varchar2(255 char) not null, accno_entity_id varchar2(255 char), accno_entity_uid varchar2(255 char), accno_entity_uid_type varchar2(255 char), req_proc_id varchar2(255 char) not null, req_service varchar2(255 char) not null, study_iuid varchar2(255 char) not null, req_phys_name_fk number(19,0) unique, ups_fk number(19,0), primary key (pk));
create table verify_observer (pk number(19,0) not null, verify_datetime varchar2(255 char) not null, observer_name_fk number(19,0) unique, instance_fk number(19,0), primary key (pk));
create index IDXi715nk4mi378f9bxflvfroa5a on content_item (rel_type);
create index IDX6iism30y000w85v649ju968sv on content_item (text_value);
create index IDXt0y05h07d9dagn9a4a9s4a5a4 on hl7psu_task (device_name);
create index IDX5shiir23exao1xpy2n5gvasrh on ian_task (device_name);
create index IDXeg0khesxr81gdimwhjiyrylw7 on instance (sop_iuid);
create index IDXdglm8ndp9y9i0uo6fgaa5rhbb on instance (sop_cuid);
create index IDXouh6caecancvsa05lknojy30j on instance (inst_no);
create index IDX5ikkfk17vijvsvtyied2xa225 on instance (content_date);
create index IDXpck1ovyd4t96mjkbbw6f8jiam on instance (content_time);
create index IDXqh8jqpe8ulsb5t7iv24scho00 on instance (sr_verified);
create index IDXgisd09x31lphi4437hwgh7ihg on instance (sr_complete);
create index IDXfncb1s641rrnoek7j47k0j06n on instance (inst_custom1);
create index IDXrr1ro1oxv6s4riib9hjkcuvuo on instance (inst_custom2);
create index IDXq5i0hxt1iyahxjiroux2h8imm on instance (inst_custom3);
create index IDXcqpv94ky100d0eguhrxpyplmv on instance_req (accession_no);
create index IDXn32ktg5h9xc1ex9x8g69w1s10 on instance_req (req_service);
create index IDX7pudwdgrg9wwc73wo65hpg517 on instance_req (req_proc_id);
create index IDX43h9ogidkcnex0e14q6u0c3jn on instance_req (sps_id);
create index IDX1typgaxhn4d0pt1f0vlp18wvb on instance_req (study_iuid);
create index IDXhy6xxbt6wi79kbxt6wsqhv77p on key_value2 (username);
create index IDX5gcbr7nnck6dxrmml1s3arpna on key_value2 (updated_time);
create index IDXr3oh859i9osv3aluoc8dcx9wk on location (storage_id, status);
create index IDXi1lnahmehau3r3j9pdyxg3p3y on location (multi_ref);
create index IDXf7c9hmq8pfypohkgkp5vkbhxp on metadata (storage_id, status);
create index IDXd0v5hjn1crha2nqbws4wj0yoj on mwl_item (updated_time);
create index IDX88bqeff7thxsmgcmtrg5l3td on mwl_item (worklist_label);
create index IDX2odo3oah39o400thy9bf0rgv0 on mwl_item (sps_id);
create index IDXkedi0qimmvs83af3jxk471uxn on mwl_item (req_proc_id);
create index IDXfpfq8q514gsime2dl8oo773d4 on mwl_item (study_iuid);
create index IDXpw8h1b4sac2sr9estyqr82pcf on mwl_item (accession_no);
create index IDXtlkw80b7pbutfj19vh6et2vs7 on mwl_item (admission_id);
create index IDX8qkftk7n30hla3v1frep9vg2q on mwl_item (institution);
create index IDXksy3uy0rvpis1sqqeojlet7lb on mwl_item (department);
create index IDXq28149iaxebyt3de2h5sm2bgl on mwl_item (modality);
create index IDX9oh3yd4prp9sfys4n0p2kd69y on mwl_item (sps_start_date);
create index IDXm20xnkg1iqetifvuegehbhekm on mwl_item (sps_start_time);
create index IDX3oigo76r1a7et491bkci96km8 on mwl_item (sps_status);
create index IDXe7rsyrt9n2mccyv1fcd2s6ikv on patient (verification_status);
create index IDXbay8wkvwegw3pmyeypv2v93k1 on patient (verification_time);
create index IDX296rccryifu6d8byisl2f4dvq on patient (num_studies);
create index IDX1ho1jyofty54ip8aqpuhi4mu1 on patient (pat_birthdate);
create index IDX545wp9un24fhgcy2lcfu1o04y on patient (pat_sex);
create index IDX9f2m2lkijm7wi0hpjsime069n on patient (pat_custom1);
create index IDXdwp6no1c4624yii6sbo59fedg on patient (pat_custom2);
create index IDX3ioui3yamjf01yny98bliqfgs on patient (pat_custom3);
create index IDXtkyjkkxxhnr0fem7m0h3844jk on patient_id (pat_id);
create index IDXd1sdyupb0vwvx23jownjnyy72 on patient_id (entity_id);
create index IDXm2jq6xe87vegohf6g10t5ptew on patient_id (entity_uid, entity_uid_type);
create index IDXgs2yshbwu0gkd33yxyv13keoh on person_name (alphabetic_name);
create index IDXala4l4egord8i2tjvjidoqd1s on person_name (ideographic_name);
create index IDX9nr8ddkp8enufvbn72esyw3n1 on person_name (phonetic_name);
create index IDXowm55at56tdjitsncsrhr93xj on rejected_instance (created_time);
create index IDX9fi64g5jjycg9dp24jjk5txg1 on series (series_iuid);
create index IDXjlgy9ifvqak4g2bxkchismw8x on series (rejection_state);
create index IDX75oc6w5ootkuwyvmrhe3tbown on series (series_no);
create index IDXb126hub0dc1o9dqp6awoispx2 on series (modality);
create index IDXmrn00m45lkq1xbehmbw5d9jbl on series (sop_cuid);
create index IDXtahx0q1ejidnsam40ans7oecx on series (tsuid);
create index IDXpq1yi70ftxhh391lhcq3e08nf on series (station_name);
create index IDXrvlxc150uexwmr1l9ojp8fgd on series (pps_start_date);
create index IDXamr00xwlatxewgj1sjp5mnf76 on series (pps_start_time);
create index IDXgwp46ofa26am9ohhccq1ohdj on series (body_part);
create index IDXtbdrfrmkmifsqhpf43065jrbs on series (laterality);
create index IDXachxn1rtfm3fbkkswlsyr75t0 on series (series_desc);
create index IDX82qea56c0kdhod3b1wu8wbrny on series (institution);
create index IDXbqu32v5v76p4qi0etptnrm0pc on series (department);
create index IDXhm39592a9n7m54dgso17irlhv on series (series_custom1);
create index IDXq3wayt2ke25fdcghaohhrjiu7 on series (series_custom2);
create index IDXd8b8irasiw8eh9tsigmwkbvae on series (series_custom3);
create index IDXb9e2bptvail8xnmb62h30h4d2 on series (sending_aet);
create index IDXlnck3a2qjo1vc430n1sy51vbr on series (receiving_aet);
create index IDXgxun7s005k8qf7qwhjhkkkkng on series (sending_pres_addr);
create index IDXe15a6qnq8jcq931agc2v48nvt on series (receiving_pres_addr);
create index IDXffpftwfkijejj09tlbxr7u5g8 on series (sending_hl7_app);
create index IDX1e4aqxc5w1557hr3fb3lqm2qb on series (sending_hl7_facility);
create index IDXgj0bxgi55bhjic9s3i4dp2aee on series (receiving_hl7_app);
create index IDXpbay159cdhwbtjvlmel6d6em2 on series (receiving_hl7_facility);
create index IDXih49lthl3udoca5opvgsdcerj on series (expiration_state);
create index IDXta3pi6exqft5encv389hwjytw on series (expiration_date);
create index IDXj6aadbh7u93bpmv18s1inrl1r on series (failed_retrieves);
create index IDX4lnegvfs65fbkjn7nmg9s8usy on series (completeness);
create index IDXhwkcpd7yv0nca7o918wm4bn69 on series (metadata_update_time);
create index IDX6xqpk4cvy49wj41p2qwixro8w on series (metadata_update_failures);
create index IDXa8vyikwd972jomyb3f6brcfh5 on series (inst_purge_time);
create index IDXer4ife08f6eaki91gt3hxt5e on series (inst_purge_state);
create index IDXftv3ijh2ud6ogoknneyqc6t9i on series (stgver_time);
create index IDXs1vceb8cu9c45j0q8tbldgol9 on series (stgver_failures);
create index IDX38mfgfnjhan2yhnwqtcrawe4 on series (compress_time);
create index IDX889438ocqfrvybu3k2eo65lpa on series (compress_failures);
create index IDXm4wanupyq3yldxgh3pbo7t68h on series_req (accession_no);
create index IDXl1fg3crmk6pjeu1x36e25h6p4 on series_req (req_service);
create index IDXp9w1wg4031w6y66w4xhx1ffay on series_req (req_proc_id);
create index IDX4uq79j30ind90jjs68gb24j6e on series_req (sps_id);
create index IDXcrnpneoalwq25p795xtrhbx2 on series_req (study_iuid);
create index IDXfjwlo6vk0gxp78eh2i7j04a5t on soundex_code (sx_pn_comp);
create index IDXnlv8hnjxmb7pobdfl094ud14u on soundex_code (sx_pn_comp_part);
create index IDX3dxkqfajcytiwjjb5rgh4nu1l on soundex_code (sx_code_value);
create index IDXtm93u8kuxnasoguns5asgdx4a on sps_station_aet (station_aet);
create index IDXqko59fn9pb87j1eu070ilfkhm on stgcmt_result (updated_time);
create index IDX7ltjgxoijy15rrwihl8euv7vh on stgcmt_result (device_name);
create index IDXgu96kxnbf2p84d1katepo0btq on stgcmt_result (exporter_id);
create index IDXj292rvji1d7hintidhgkkcbpw on stgcmt_result (task_fk);
create index IDXf718gnu5js0mdg39q6j7fklia on stgcmt_result (batch_id);
create index IDXp65blcj4h0uh2itb0bp49mc07 on stgcmt_result (study_iuid);
create index IDXnyoefler7agcmxc8t8yfngq7e on stgcmt_result (stgcmt_status);
create index IDXq8k2sl3kjl18qg1nr19l47tl1 on study (access_time);
create index IDX6ry2squ4qcv129lxpae1oy93m on study (created_time);
create index IDX24av2ewa70e7cykl340n63aqd on study (access_control_id);
create index IDXhwu9omd369ju3nufufxd3vof2 on study (rejection_state);
create index IDXfypbtohf5skbd3bkyd792a6dt on study (storage_ids);
create index IDXa1rewlmf8uxfgshk25f6uawx2 on study (study_date);
create index IDX16t2xvj9ttyvbwh1ijeve01ii on study (study_time);
create index IDX2ofn5q0fdfc6941e5j34bplmv on study (accession_no);
create index IDXn5froudmhk14pbhgors43xi68 on study (admission_id);
create index IDXj3q7fkhhiu4bolglyve3lv385 on study (study_desc);
create index IDXksy103xef0hokd33y8ux7afxl on study (study_custom1);
create index IDXj63d3ip6x4xslkmyks1l89aay on study (study_custom2);
create index IDX8xolm3oljt08cuheepwq3fls7 on study (study_custom3);
create index IDXfyasyw3wco6hoj2entr7l6d09 on study (expiration_state);
create index IDXmlk5pdi8une92kru8g2ppappx on study (expiration_date);
create index IDX9qvng5j8xnli8yif7p0rjngb2 on study (failed_retrieves);
create index IDXgl5rq54a0tr8nreu27c2t04rb on study (completeness);
create index IDXcl9dmi0kb97ov1cjh7rn3dhve on study (ext_retrieve_aet);
create index IDXq7vxiaj1q6ojfxdq1g9jjxgqv on study (study_size);
create index IDXm47ruxpag7pq4gtn12lc63yfe on task (device_name);
create index IDXr2bcfyreh4n9h392iik1aa6sh on task (queue_name);
create index IDXa582by7kuyuhk8hi41tkelhrw on task (task_type);
create index IDX7y5ucdiygunyg2nh7qrs70e7k on task (task_status);
create index IDX76hkd9mjludoohse4g0ru1mg8 on task (created_time);
create index IDX9htwq4ofarp6m88r3ao0grt8j on task (updated_time);
create index IDXxwqht1afwe7k27iulvggnwwl on task (scheduled_time);
create index IDXk6dxmm1gu6u23xq03hbk80m4r on task (batch_id);
create index IDX17gcm1xo6fkujauguyjfxfb2k on task (local_aet);
create index IDX81xi6wnv5b10x3723fxt5bmew on task (remote_aet);
create index IDXf7c43c242ybnvcn3o50lrcpkh on task (destination_aet);
create index IDXpknlk8ggf8lnq38lq3gacvvpt on task (check_missing);
create index IDX1lchdfbbwkjbg7a6coy5t8iq7 on task (check_different);
create index IDXow0nufrtniev7nkh7d0uv5mxe on task (compare_fields);
create index IDX6a0y0rsssms4mtm9bpkw8vgl6 on task (study_iuid, series_iuid, sop_iuid);
create index IDX1umoxe7ig9n21q885mncxeq9 on ups (updated_time);
create index IDXkgwfwmxj3i0n7c404uvhsav1g on ups (ups_priority);
create index IDXd3ejkrtcim0q3cbwpq4n9skes on ups (ups_label);
create index IDX7e44lxlg0m2l2wfdo3k2tec7o on ups (worklist_label);
create index IDXkh194du6g35fi5l80vbj18nnp on ups (start_date_time);
create index IDXe57ifctiig366oq9mhab8law3 on ups (expiration_date_time);
create index IDX1hdr3ml1rwugwkmo3eks4no5p on ups (expected_end_date_time);
create index IDXbrtgc3vpnoaq1xm80m568r16y on ups (input_readiness_state);
create index IDXsqoo5rr8pu2qe4gtdne3xh031 on ups (admission_id);
create index IDXcrl67piqoxiccp3i6ckktphdd on ups (replaced_iuid);
create index IDXc8obxmqpdcy37r3pjga2pukac on ups (ups_state);
create index IDXrfium2ybikqm1f4xmi24mnv4u on ups_req (accession_no);
create index IDXemsk27nclko11ph2tcj5vk7hg on ups_req (req_service);
create index IDX524vr0q4c0kvyjwov74eru44x on ups_req (req_proc_id);
create index IDXhf0tly8umknn77civcsi0tdih on ups_req (study_iuid);
create index IDX5btv5autls384ulwues8lym4p on verify_observer (verify_datetime);
alter table content_item add constraint FKfra6ee5jtybfp94ldpvva623o foreign key (code_fk) references code;
alter table content_item add constraint FK7rpy6unnb5b18b8ieuqr9w9i9 foreign key (name_fk) references code;
alter table content_item add constraint FKei15n1lk1h1e8f89e9ubalm7q foreign key (instance_fk) references instance;
alter table global_subscription add constraint FKqkchf2ue2j1p3fv2o94rhacvi foreign key (matchkeys_fk) references dicomattrs;
alter table hl7psu_task add constraint FKlvjl0o0sdhht440wccag722e4 foreign key (mpps_fk) references mpps;
alter table ian_task add constraint FKs3re94tlv0dbd5go33mwdk6dr foreign key (mpps_fk) references mpps;
alter table instance add constraint FKokrgkyvch35m6iwr309mawsna foreign key (dicomattrs_fk) references dicomattrs;
alter table instance add constraint FKqmk050ojwer9ujsbl74d4kf6e foreign key (srcode_fk) references code;
alter table instance add constraint FKe92yganh695k2y4hxfqxtesg1 foreign key (series_fk) references series;
alter table instance_req add constraint FK8leut3c0gfxcg6y3lbjlpt2bt foreign key (req_phys_name_fk) references person_name;
alter table instance_req add constraint FKmbg8j00cvubj76doba8funq8j foreign key (instance_fk) references instance;
alter table location add constraint FKpp9xjy946uspo3piayc6ofels foreign key (instance_fk) references instance;
alter table location add constraint FKendncyyv928u41dfo1x09s644 foreign key (uidmap_fk) references uidmap;
alter table mpps add constraint FKnhstgtx2w1xd61u4iqbn731pu foreign key (dicomattrs_fk) references dicomattrs;
alter table mpps add constraint FK2m3l9bh173bmq88ukf81yd9ow foreign key (discreason_code_fk) references code;
alter table mpps add constraint FKs7mb8qsr1mjijnw9bvx0dhqab foreign key (patient_fk) references patient;
alter table mwl_item add constraint FK9vjk41q61e9x9n4qfve6jud8s foreign key (dicomattrs_fk) references dicomattrs;
alter table mwl_item add constraint FKqui6rvqyg1qfujae4mw3o0nbm foreign key (inst_code_fk) references code;
alter table mwl_item add constraint FKpl6u7oyyp6o3ca8r9jbxv5oge foreign key (dept_code_fk) references code;
alter table mwl_item add constraint FKeursgxiy2u6ws39cgn1b25e6k foreign key (patient_fk) references patient;
alter table mwl_item add constraint FKf5l3x4bfqn3jv8mhj617kidx7 foreign key (perf_phys_name_fk) references person_name;
alter table patient add constraint FKe8j5c2rhq67rt3opqfggoplt2 foreign key (dicomattrs_fk) references dicomattrs;
alter table patient add constraint FKc66cfkdwiu7eq65kgmxilrocw foreign key (merge_fk) references patient;
alter table patient add constraint FKig1mwm5jpkyq6733t0hrf56g foreign key (pat_name_fk) references person_name;
alter table patient add constraint FKjh4miooi709vj5l6xi8h95f3e foreign key (resp_person_fk) references person_name;
alter table patient_id add constraint FKih8d22x50j7orytfmigrnssea foreign key (patient_fk) references patient;
alter table rejected_instance add constraint FK27xpx6okj63sunyo76tf0s913 foreign key (reject_code_fk) references code;
alter table rel_study_pcode add constraint FKlia0q74j0xhj2u0avy1wbbx7q foreign key (pcode_fk) references code;
alter table rel_study_pcode add constraint FKta5515ogakmavm1swi6tw1n2n foreign key (study_fk) references study;
alter table rel_task_dicomattrs add constraint FK53sqs6uiua7ff45u94lrv50t7 foreign key (dicomattrs_fk) references dicomattrs;
alter table rel_task_dicomattrs add constraint FKhd3dj3u43xxgdxn7w5imp5ank foreign key (task_fk) references task;
alter table rel_ups_perf_code add constraint FK6om2durembdfk2rmd29dlcm2t foreign key (perf_code_fk) references code;
alter table rel_ups_perf_code add constraint FK31cp9ux8xb2dcu0nv84tgd8um foreign key (ups_fk) references ups;
alter table rel_ups_station_class_code add constraint FK62f8dua3p8bxv3vilctc7pd42 foreign key (station_class_code_fk) references code;
alter table rel_ups_station_class_code add constraint FKf0y92ufejerf9dwv8sl6kdkae foreign key (ups_fk) references ups;
alter table rel_ups_station_location_code add constraint FKp5d05caciw2cqik5uqt7r8w6p foreign key (station_location_code_fk) references code;
alter table rel_ups_station_location_code add constraint FKlxb9i1b48mfxo0y72fpeoxl48 foreign key (ups_fk) references ups;
alter table rel_ups_station_name_code add constraint FK308ga4grefjjwmrwtsirjmbhh foreign key (station_name_code_fk) references code;
alter table rel_ups_station_name_code add constraint FKd4gjwmhmlphp865fxiqjypwo2 foreign key (ups_fk) references ups;
alter table series add constraint FKtih7mdqwcklym58jd9wn3itjq foreign key (dicomattrs_fk) references dicomattrs;
alter table series add constraint FK6nn55bx7pqlmimgfnhfpjra94 foreign key (inst_code_fk) references code;
alter table series add constraint FKnpdeeclrflvuxajeqjmk6utf foreign key (dept_code_fk) references code;
alter table series add constraint FK84fpblugeadm5u6dw1idi80a0 foreign key (metadata_fk) references metadata;
alter table series add constraint FK5p2gub2u40fyh2ch6bp6nan4l foreign key (perf_phys_name_fk) references person_name;
alter table series add constraint FK3196nws7ngapmsmtoafb4e88j foreign key (study_fk) references study;
alter table series_query_attrs add constraint FKsk791fnscydy7whj3lvrp3j1a foreign key (series_fk) references series;
alter table series_req add constraint FK15lid2bqbrsmjatxiq0vug4wq foreign key (req_phys_name_fk) references person_name;
alter table series_req add constraint FK1gs2u7w7uefvi7dcjg9vlp23x foreign key (series_fk) references series;
alter table soundex_code add constraint FKctukwjaer0axw2jwv3bfj67r2 foreign key (person_name_fk) references person_name;
alter table sps_station_aet add constraint FKmeklscb7t55i8mb2d4cjucywd foreign key (mwl_item_fk) references mwl_item;
alter table study add constraint FK2ktu3hbxxalrngfhyp4j6pf70 foreign key (dicomattrs_fk) references dicomattrs;
alter table study add constraint FKocnq3so9ej7h0mnd6a6arjf6c foreign key (patient_fk) references patient;
alter table study add constraint FKndwmntu3lsjd78erctnbposyr foreign key (ref_phys_name_fk) references person_name;
alter table study_query_attrs add constraint FKmu32jq25y6qkimi7hn7d4s2hp foreign key (study_fk) references study;
alter table subscription add constraint FKh9mdhriyx32gr91pfdgnl48f0 foreign key (ups_fk) references ups;
alter table ups add constraint FKaddby69vtwxpssgaa12ct6pn3 foreign key (dicomattrs_fk) references dicomattrs;
alter table ups add constraint FKjcmu4x6x02r0tc1d28xb3nf17 foreign key (patient_fk) references patient;
alter table ups add constraint FKr3t1gbo2e42oleaqeastvv5ej foreign key (ups_code_fk) references code;
alter table ups_req add constraint FK1b5veu90oftv8o95nxx2xndpb foreign key (req_phys_name_fk) references person_name;
alter table ups_req add constraint FKh1sjrdq663dnk8j7hsthun4ie foreign key (ups_fk) references ups;
alter table verify_observer add constraint FK8vo3f94xgum0qajsjqnlnqjo4 foreign key (observer_name_fk) references person_name;
alter table verify_observer add constraint FKkpcwkrsipamdg81mao7nkmdc2 foreign key (instance_fk) references instance;
