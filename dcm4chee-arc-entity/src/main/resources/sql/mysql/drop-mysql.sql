alter table content_item drop foreign key FK_gudw6viy7lrf5t5hetw7mbgh5;
alter table content_item drop foreign key FK_pyrd1nhijag5ct0ee9xqq4h78;
alter table content_item drop foreign key FK_9kpe6whsov3ur9rph4ih2vi5a;
alter table global_subscription drop foreign key FK_f1l196ykcnh7s2pwo6qnmltw7;
alter table hl7psu_task drop foreign key FK_pev4urgkk7id2h1ijhv8domjx;
alter table ian_task drop foreign key FK_1fuh251le2hid2byw90hd1mly;
alter table instance drop foreign key FK_jxfu47kwjk3kkkyrwewjw8a4n;
alter table instance drop foreign key FK_7w6f9bi2w91qr2abl6ddxnrwq;
alter table instance drop foreign key FK_s4tgrew4sh4qxoupmk3gihtrk;
alter table instance_req drop foreign key FK_cqmmps9maltjybl44t4cck404;
alter table instance_req drop foreign key FK_47n586hkafgp9m1etqohgfybl;
alter table location drop foreign key FK_hjtlcwsvwihs4khh961d423e7;
alter table location drop foreign key FK_bfk5vl6eoxaf0hhwiu3rbgmkn;
alter table mpps drop foreign key FK_o49fec996jvdo31o7ysmsn9s2;
alter table mpps drop foreign key FK_nrigpgue611m33rao03nnfe5l;
alter table mpps drop foreign key FK_ofg0lvfxad6r5oigw3y6da27u;
alter table mwl_item drop foreign key FK_6qj8tkh6ib9w2pjqwvqe23ko;
alter table mwl_item drop foreign key FK_t4vpsywvy0axeutmdgc0ye3nk;
alter table mwl_item drop foreign key FK_hqecoo67sflk190dxyc0hnf0c;
alter table mwl_item drop foreign key FK_vkxtls2wr17wgxnxj7b2fe32;
alter table mwl_item drop foreign key FK_44qwwvs50lgpog2cqmicxgt1f;
alter table patient drop foreign key FK_5lgndn3gn7iug3kuewiy9q124;
alter table patient drop foreign key FK_sk77bwjgaoetvy1pbcgqf08g;
alter table patient drop foreign key FK_39gahcxyursxfxe2ucextr65s;
alter table patient drop foreign key FK_rj42ffdtimnrcwmqqlvj24gi2;
alter table patient drop foreign key FK_56r2g5ggptqgcvb3hl11adke2;
alter table rejected_instance drop foreign key FK_iafiq2ugv5rd6fonwd0vd7xdx;
alter table rel_study_pcode drop foreign key FK_fryhnb2ppb6fcop3jrrfwvnfy;
alter table rel_study_pcode drop foreign key FK_mnahh8fh77d365m6w2x4x3f4q;
alter table rel_task_dicomattrs drop foreign key FK_e0gtunmen48q8imxggunt7gt7;
alter table rel_task_dicomattrs drop foreign key FK_pwaoih2f4ay4c00avvt79de7h;
alter table rel_ups_perf_code drop foreign key FK_6asj28yy5se9mp443b6ryefd2;
alter table rel_ups_perf_code drop foreign key FK_6m06tt8ku376qxkro94xpteus;
alter table rel_ups_station_class_code drop foreign key FK_q26e06qk9gwviwe2ug0f86doa;
alter table rel_ups_station_class_code drop foreign key FK_e1ioaswm010jlsq6kl7y3um1c;
alter table rel_ups_station_location_code drop foreign key FK_kl60ab0k5c1p8qii9ya16424x;
alter table rel_ups_station_location_code drop foreign key FK_9f0l4glqwpq12d11w9osd475m;
alter table rel_ups_station_name_code drop foreign key FK_jtv4r8f88f6gfte0fa36w5y9o;
alter table rel_ups_station_name_code drop foreign key FK_8jf5xe8ot2yammv3ksd5xrgif;
alter table series drop foreign key FK_bdj2kuutidekc2en6dckev7l6;
alter table series drop foreign key FK_oiq81nulcmtg6p85iu31igtf5;
alter table series drop foreign key FK_avp2oeuufo8axv5j184cchrop;
alter table series drop foreign key FK_pu4p7k1o9hleuk9rmxvw2ybj6;
alter table series drop foreign key FK_5n4bxxb2xa7bvvq26ao7wihky;
alter table series drop foreign key FK_1og1krtgxfh207rtqjg0r7pbd;
alter table series_query_attrs drop foreign key FK_eiwosf6pcc97n6y282cv1n54k;
alter table series_req drop foreign key FK_bcn0jtvurqutw865pwp34pejb;
alter table series_req drop foreign key FK_bdkjk6ww0ulrb0nhf41c7liwt;
alter table soundex_code drop foreign key FK_dh7lahwi99hk6bttrk75x4ckc;
alter table sps_station_aet drop foreign key FK_js5xqyw5qa9rpttwmck14duow;
alter table study drop foreign key FK_5w0oynbw061mwu1rr9mrb6kj4;
alter table study drop foreign key FK_e3fdaqhw7u60trs5aspf4sna9;
alter table study drop foreign key FK_49eet5qgcsb32ktsqrf1mj3x2;
alter table study_query_attrs drop foreign key FK_sxccj81423w8o6w2tsb7nshy9;
alter table subscription drop foreign key FK_jadcs2aho4ijh639r67qgk0g0;
alter table ups drop foreign key FK_3frtpy5cstsoxk5jxw9cutr33;
alter table ups drop foreign key FK_8xiqdli1p8cyw1y4hwyqhimcx;
alter table ups drop foreign key FK_1retecpk22a2tysmi5o6xcpbh;
alter table ups_req drop foreign key FK_kocdb2pxx2fymu1modhneb4xm;
alter table ups_req drop foreign key FK_7vt6m05r0hertks2fcngd5wn1;
alter table verify_observer drop foreign key FK_105wt9hglqsmtnoxgma9x18vj;
alter table verify_observer drop foreign key FK_qjgrn9rfyyt6sv14utk9ijcfq;
drop table if exists code;
drop table if exists content_item;
drop table if exists dicomattrs;
drop table if exists global_subscription;
drop table if exists hl7psu_task;
drop table if exists ian_task;
drop table if exists id_sequence;
drop table if exists instance;
drop table if exists instance_req;
drop table if exists key_value2;
drop table if exists location;
drop table if exists metadata;
drop table if exists mpps;
drop table if exists mwl_item;
drop table if exists patient;
drop table if exists patient_demographics;
drop table if exists patient_id;
drop table if exists person_name;
drop table if exists rejected_instance;
drop table if exists rel_study_pcode;
drop table if exists rel_task_dicomattrs;
drop table if exists rel_ups_perf_code;
drop table if exists rel_ups_station_class_code;
drop table if exists rel_ups_station_location_code;
drop table if exists rel_ups_station_name_code;
drop table if exists series;
drop table if exists series_query_attrs;
drop table if exists series_req;
drop table if exists soundex_code;
drop table if exists sps_station_aet;
drop table if exists stgcmt_result;
drop table if exists study;
drop table if exists study_query_attrs;
drop table if exists subscription;
drop table if exists task;
drop table if exists uidmap;
drop table if exists ups;
drop table if exists ups_req;
drop table if exists verify_observer;
