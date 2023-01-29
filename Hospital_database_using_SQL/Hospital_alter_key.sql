
 
 ----composite key
alter table trained_in add primary key (physician,treatment);

alter table affiliated_with add primary key (physician,department);

alter table prescribes add primary key (physician,patient,medication,dates);

alter table block add primary key (blockfloor,blockcode);

alter table on_call add primary key (nurse,blockfloor,blockcode,oncall,oncallend);

alter table undergoes add primary key (patient,procedure,stay,dates);

alter table BLOCK add primary key (BLOCKFLOOR,BLOCKCODE);


---foreign key

alter table department add constraint fk_head foreign key(head) REFERENCES physician(employeeid);

alter table affiliated_with add constraint fk_phy1 foreign key(physician) REFERENCES physician(employeeid);

alter table affiliated_with add constraint fk_depart foreign key(department) REFERENCES department(department_id);

alter table trained_in add constraint fk_phy2 foreign key(physician) REFERENCES physician(employeeid);

alter table trained_in add constraint fk_trat1 foreign key(treatment) REFERENCES procedure(code);


alter table appointment add constraint fk_patient1 foreign key(patient) REFERENCES patient(ssn);

alter table appointment add constraint fk_prepnurse1 foreign key(prepnurse) REFERENCES nurse(employeeid);

alter table appointment add constraint fk_phy4 foreign key(physician) REFERENCES physician(employeeid);

alter table prescribes add constraint fk_phy5 foreign key(physician) REFERENCES physician(employeeid);

alter table prescribes add constraint fk_patient3 foreign key(patient) REFERENCES patient(ssn);

alter table prescribes add constraint fk_medi foreign key(medication) REFERENCES medication(code);

alter table prescribes add constraint fk_apponit1 foreign key(appointment) REFERENCES appointment(appointmentid);

alter table on_call add constraint fk_nurse1 foreign key(nurse) REFERENCES nurse(employeeid);

--error
alter table stay add constraint fk_patient6 foreign key(patient) REFERENCES patient(ssn);

alter table stay add constraint fk_room foreign key(room) REFERENCES room(roomnumber);

alter table undergoes add constraint fk_pati5 foreign key(patient) REFERENCES patient(ssn);

alter table undergoes add constraint fk_procedure1 foreign key(procedure) REFERENCES procedure(code);

alter table undergoes add constraint fk_stay1 foreign key(stay) REFERENCES stay(stayid);

alter table undergoes add constraint fk_phy9 foreign key(physician) REFERENCES physician(employeeid);

alter table undergoes add constraint fk_assist_nurse foreign key(assistingnurse) REFERENCES nurse(employeeid);

alter table ROOM add constraint fk_BLOCK foreign key(BLOCKFLOOR,BLOCKCODE) REFERENCES BLOCK(BLOCKFLOOR,BLOCKCODE);

ALTER TABLE ON_CALL ADD CONSTRAINT FK_FLOOR FOREIGN KEY (BLOCKFLOOR,BLOCKCODE) REFERENCES BLOCK(BLOCKFLOOR,BLOCKCODE);
