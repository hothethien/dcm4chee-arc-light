alter table content_item drop constraint if exists FK_gudw6viy7lrf5t5hetw7mbgh5;
alter table content_item drop constraint if exists FK_pyrd1nhijag5ct0ee9xqq4h78;
alter table content_item drop constraint if exists FK_9kpe6whsov3ur9rph4ih2vi5a;
alter table global_subscription drop constraint if exists FK_f1l196ykcnh7s2pwo6qnmltw7;
alter table hl7psu_task drop constraint if exists FK_pev4urgkk7id2h1ijhv8domjx;
alter table ian_task drop constraint if exists FK_1fuh251le2hid2byw90hd1mly;
alter table instance drop constraint if exists FK_jxfu47kwjk3kkkyrwewjw8a4n;
alter table instance drop constraint if exists FK_7w6f9bi2w91qr2abl6ddxnrwq;
alter table instance drop constraint if exists FK_s4tgrew4sh4qxoupmk3gihtrk;
alter table instance_req drop constraint if exists FK_cqmmps9maltjybl44t4cck404;
alter table instance_req drop constraint if exists FK_47n586hkafgp9m1etqohgfybl;
alter table location drop constraint if exists FK_hjtlcwsvwihs4khh961d423e7;
alter table location drop constraint if exists FK_bfk5vl6eoxaf0hhwiu3rbgmkn;
alter table mpps drop constraint if exists FK_o49fec996jvdo31o7ysmsn9s2;
alter table mpps drop constraint if exists FK_nrigpgue611m33rao03nnfe5l;
alter table mpps drop constraint if exists FK_ofg0lvfxad6r5oigw3y6da27u;
alter table mwl_item drop constraint if exists FK_6qj8tkh6ib9w2pjqwvqe23ko;
alter table mwl_item drop constraint if exists FK_t4vpsywvy0axeutmdgc0ye3nk;
alter table mwl_item drop constraint if exists FK_hqecoo67sflk190dxyc0hnf0c;
alter table mwl_item drop constraint if exists FK_vkxtls2wr17wgxnxj7b2fe32;
alter table mwl_item drop constraint if exists FK_44qwwvs50lgpog2cqmicxgt1f;
alter table patient drop constraint if exists FK_5lgndn3gn7iug3kuewiy9q124;
alter table patient drop constraint if exists FK_sk77bwjgaoetvy1pbcgqf08g;
alter table patient drop constraint if exists FK_rj42ffdtimnrcwmqqlvj24gi2;
alter table patient drop constraint if exists FK_56r2g5ggptqgcvb3hl11adke2;
alter table patient_id drop constraint if exists FK_hba9466n4re9re8id3c8abmnv;
alter table rejected_instance drop constraint if exists FK_iafiq2ugv5rd6fonwd0vd7xdx;
alter table rel_study_pcode drop constraint if exists FK_fryhnb2ppb6fcop3jrrfwvnfy;
alter table rel_study_pcode drop constraint if exists FK_mnahh8fh77d365m6w2x4x3f4q;
alter table rel_task_dicomattrs drop constraint if exists FK_e0gtunmen48q8imxggunt7gt7;
alter table rel_task_dicomattrs drop constraint if exists FK_pwaoih2f4ay4c00avvt79de7h;
alter table rel_ups_perf_code drop constraint if exists FK_6asj28yy5se9mp443b6ryefd2;
alter table rel_ups_perf_code drop constraint if exists FK_6m06tt8ku376qxkro94xpteus;
alter table rel_ups_station_class_code drop constraint if exists FK_q26e06qk9gwviwe2ug0f86doa;
alter table rel_ups_station_class_code drop constraint if exists FK_e1ioaswm010jlsq6kl7y3um1c;
alter table rel_ups_station_location_code drop constraint if exists FK_kl60ab0k5c1p8qii9ya16424x;
alter table rel_ups_station_location_code drop constraint if exists FK_9f0l4glqwpq12d11w9osd475m;
alter table rel_ups_station_name_code drop constraint if exists FK_jtv4r8f88f6gfte0fa36w5y9o;
alter table rel_ups_station_name_code drop constraint if exists FK_8jf5xe8ot2yammv3ksd5xrgif;
alter table series drop constraint if exists FK_bdj2kuutidekc2en6dckev7l6;
alter table series drop constraint if exists FK_oiq81nulcmtg6p85iu31igtf5;
alter table series drop constraint if exists FK_avp2oeuufo8axv5j184cchrop;
alter table series drop constraint if exists FK_pu4p7k1o9hleuk9rmxvw2ybj6;
alter table series drop constraint if exists FK_5n4bxxb2xa7bvvq26ao7wihky;
alter table series drop constraint if exists FK_1og1krtgxfh207rtqjg0r7pbd;
alter table series_query_attrs drop constraint if exists FK_eiwosf6pcc97n6y282cv1n54k;
alter table series_req drop constraint if exists FK_bcn0jtvurqutw865pwp34pejb;
alter table series_req drop constraint if exists FK_bdkjk6ww0ulrb0nhf41c7liwt;
alter table soundex_code drop constraint if exists FK_dh7lahwi99hk6bttrk75x4ckc;
alter table sps_station_aet drop constraint if exists FK_js5xqyw5qa9rpttwmck14duow;
alter table study drop constraint if exists FK_5w0oynbw061mwu1rr9mrb6kj4;
alter table study drop constraint if exists FK_e3fdaqhw7u60trs5aspf4sna9;
alter table study drop constraint if exists FK_49eet5qgcsb32ktsqrf1mj3x2;
alter table study_query_attrs drop constraint if exists FK_sxccj81423w8o6w2tsb7nshy9;
alter table subscription drop constraint if exists FK_jadcs2aho4ijh639r67qgk0g0;
alter table ups drop constraint if exists FK_3frtpy5cstsoxk5jxw9cutr33;
alter table ups drop constraint if exists FK_8xiqdli1p8cyw1y4hwyqhimcx;
alter table ups drop constraint if exists FK_1retecpk22a2tysmi5o6xcpbh;
alter table ups_req drop constraint if exists FK_kocdb2pxx2fymu1modhneb4xm;
alter table ups_req drop constraint if exists FK_7vt6m05r0hertks2fcngd5wn1;
alter table verify_observer drop constraint if exists FK_105wt9hglqsmtnoxgma9x18vj;
alter table verify_observer drop constraint if exists FK_qjgrn9rfyyt6sv14utk9ijcfq;
drop table code cascade;
drop table content_item cascade;
drop table dicomattrs cascade;
drop table global_subscription cascade;
drop table hl7psu_task cascade;
drop table ian_task cascade;
drop table id_sequence cascade;
drop table instance cascade;
drop table instance_req cascade;
drop table key_value2 cascade;
drop table location cascade;
drop table metadata cascade;
drop table mpps cascade;
drop table mwl_item cascade;
drop table patient cascade;
drop table patient_demographics cascade;
drop table patient_id cascade;
drop table person_name cascade;
drop table rejected_instance cascade;
drop table rel_study_pcode cascade;
drop table rel_task_dicomattrs cascade;
drop table rel_ups_perf_code cascade;
drop table rel_ups_station_class_code cascade;
drop table rel_ups_station_location_code cascade;
drop table rel_ups_station_name_code cascade;
drop table series cascade;
drop table series_query_attrs cascade;
drop table series_req cascade;
drop table soundex_code cascade;
drop table sps_station_aet cascade;
drop table stgcmt_result cascade;
drop table study cascade;
drop table study_query_attrs cascade;
drop table subscription cascade;
drop table task cascade;
drop table uidmap cascade;
drop table ups cascade;
drop table ups_req cascade;
drop table verify_observer cascade;
drop sequence code_pk_seq;
drop sequence content_item_pk_seq;
drop sequence dicomattrs_pk_seq;
drop sequence global_subscription_pk_seq;
drop sequence hl7psu_task_pk_seq;
drop sequence ian_task_pk_seq;
drop sequence instance_pk_seq;
drop sequence instance_req_pk_seq;
drop sequence key_value2_pk_seq;
drop sequence location_pk_seq;
drop sequence metadata_pk_seq;
drop sequence mpps_pk_seq;
drop sequence mwl_item_pk_seq;
drop sequence patient_id_pk_seq;
drop sequence patient_pk_seq;
drop sequence person_name_pk_seq;
drop sequence rejected_instance_pk_seq;
drop sequence series_pk_seq;
drop sequence series_query_attrs_pk_seq;
drop sequence series_req_pk_seq;
drop sequence soundex_code_pk_seq;
drop sequence stgcmt_result_pk_seq;
drop sequence study_pk_seq;
drop sequence study_query_attrs_pk_seq;
drop sequence subscription_pk_seq;
drop sequence task_pk_seq;
drop sequence uidmap_pk_seq;
drop sequence ups_pk_seq;
drop sequence ups_request_pk_seq;
drop sequence verify_observer_pk_seq;
