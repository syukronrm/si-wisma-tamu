create table tamu(
id_tamu varchar(6) not null,
telepon_tamu integer,
nama_tamu varchar(100),
alamat_tamu varchar(200),
constraint id_tamu_pk primary key (id_tamu));

create table petugas(
id_petugas varchar(6) not null,
nama_petugas varchar(50),
alamat_petugas varchar (50),
telepon_petugas integer,
constraint id_petugas_pk primary key (id_petugas));

create table wisma(
id_wisma varchar(6) not null,
nama_wisma varchar(20),
alamat_wisma varchar(200),
constraint id_wisma_pk primary key (id_wisma)
);

create table jenis_kamar(
id_jenis varchar(6),
nama_jenis varchar(20),
harga integer,
constraint id_jenis_pk primary key (id_jenis)
);

create table kamar (
id_kamar varchar(6),
id_jenis varchar(6),
id_wisma varchar(6),
status_kamar varchar(10),
constraint id_kamar_pk primary key (id_kamar),
constraint id_jenis1_fk foreign key (id_jenis) references
  jenis_kamar(id_jenis) on delete cascade,
constraint id_wisma_fk foreign key (id_wisma) references
  wisma(id_wisma) on delete cascade
);

create table fasilitas(
id_fasilitas varchar(6),
id_jenis varchar(6),
nama_fasilitas varchar(20),
harga_fasilitas integer,
constraint id_fasilitas_pk primary key (id_fasilitas),
constraint id_jenis_fk1 foreign key (id_jenis) references jenis_kamar(id_jenis)  on delete cascade
);

create table transaksi_sewakamar(
id_transaksi varchar(6) not null,
id_tamu varchar(6),
id_petugas varchar(6),
tgl_transaksi TIMESTAMP,
lama integer,
tgl_checkin TIMESTAMP,
tgl_checkout TIMESTAMP,
tgl_bayar TIMESTAMP,
denda integer,
constraint id_transaksi_pk primary key (id_transaksi),
constraint id_tamu_fk foreign key (id_tamu) references TAMU(id_tamu) on delete cascade,
constraint id_petugas_fk foreign key (id_petugas) references petugas(id_petugas) on delete cascade
);

create table menyewa (
id_transaksi varchar(6),
id_kamar varchar(6),
constraint id_primary_pk primary key (id_transaksi,id_kamar),
constraint id_kamar_fk foreign key (id_kamar) references kamar(id_kamar) on delete cascade,
constraint id_transaksi_fk1 foreign key (id_transaksi)   references transaksi_sewakamar(id_transaksi)  on delete cascade
);


CREATE SEQUENCE tamu_seq
MINVALUE 1
START WITH 1
INCREMENT BY 1
CACHE 10;

insert into tamu values ('TA'||to_char(tamu_seq.nextval,'FM000'),'085736760330','Andreas','Blitar, Jawa Timur');
insert into tamu values ('TA'||to_char(tamu_seq.nextval,'FM000'),'085123765890','Yudhis','Surabaya, Jawa Timur');
insert into tamu values ('TA'||to_char(tamu_seq.nextval,'FM000'),'085098123765','Habibur','Gresik, Jawa Timur');
insert into tamu values ('TA'||to_char(tamu_seq.nextval,'FM000'),'085456789123','Rilo','Sidoarjo, Jawa Timur');
insert into tamu values ('TA'||to_char(tamu_seq.nextval,'FM000'),'085654987431','Rifail','Surabaya, Jawa Timur');

CREATE SEQUENCE petugas_seq
MINVALUE 1
START WITH 1
INCREMENT BY 1
CACHE 10;

insert into petugas values ('PE'||to_char(petugas_seq.nextval,'FM000'),'Habibur','Dian Park Regency, Surabaya','089761432745');
insert into petugas values ('PE'||to_char(petugas_seq.nextval,'FM000'),'Rilo','Keputih, Sukolilo, Surabaya','081763222998');
insert into petugas values ('PE'||to_char(petugas_seq.nextval,'FM000'),'Ahmad','Perum Mengunggul Jaya No E1, Surabaya','085673913753');

CREATE SEQUENCE jenis_kamar_seq
MINVALUE 1
START WITH 1
INCREMENT BY 1
CACHE 10;

insert into jenis_kamar values('JK'||to_char(jenis_kamar_seq.nextval,'FM000'),'Standar','140000');
insert into jenis_kamar values('JK'||to_char(jenis_kamar_seq.nextval,'FM000'),'Eksekutif','170000');
insert into jenis_kamar values('JK'||to_char(jenis_kamar_seq.nextval,'FM000'),'VIP','200000');
insert into jenis_kamar values('JK'||to_char(jenis_kamar_seq.nextval,'FM000'),'Standar','150000');
insert into jenis_kamar values('JK'||to_char(jenis_kamar_seq.nextval,'FM000'),'Eksekutif','180000');
insert into jenis_kamar values('JK'||to_char(jenis_kamar_seq.nextval,'FM000'),'Sewa rumah','300000');

CREATE SEQUENCE wisma_seq
MINVALUE 1
START WITH 1
INCREMENT BY 1
CACHE 10;

insert into wisma values('WM'||to_char(wisma_seq.nextval,'FM000'),'Bougenville','Jl. Teknik Arsitektur Blok H 8, Perumdos Kampus ITS, Keputih- Sukolilo, Surabaya');
insert into wisma values('WM'||to_char(wisma_seq.nextval,'FM000'),'Jasmine','Jl. Teknik Sipil Blok I-19, Perumdos Kampus ITS, Keputih-Sukolilo, Surabaya');
insert into wisma values('WM'||to_char(wisma_seq.nextval,'FM000'),'Flamboyan','Jl. Hidrodinamika No.1 Perum ITS');

CREATE SEQUENCE kamar_seq
MINVALUE 1
START WITH 1
INCREMENT BY 1
CACHE 10;

insert into kamar values('KM'||to_char(kamar_seq.nextval,'FM000'),'JK004','WM001','KOSONG');
insert into kamar values('KM'||to_char(kamar_seq.nextval,'FM000'),'JK004','WM001','KOSONG');
insert into kamar values('KM'||to_char(kamar_seq.nextval,'FM000'),'JK006','WM002','KOSONG');
insert into kamar values('KM'||to_char(kamar_seq.nextval,'FM000'),'JK005','WM001','KOSONG');
insert into kamar values('KM'||to_char(kamar_seq.nextval,'FM000'),'JK001','WM003','KOSONG');
insert into kamar values('KM'||to_char(kamar_seq.nextval,'FM000'),'JK002','WM003','KOSONG');
insert into kamar values('KM'||to_char(kamar_seq.nextval,'FM000'),'JK002','WM003','KOSONG');
insert into kamar values('KM'||to_char(kamar_seq.nextval,'FM000'),'JK005','WM001','KOSONG');
insert into kamar values('KM'||to_char(kamar_seq.nextval,'FM000'),'JK004','WM001','KOSONG');
insert into kamar values('KM'||to_char(kamar_seq.nextval,'FM000'),'JK001','WM003','KOSONG');
insert into kamar values('KM'||to_char(kamar_seq.nextval,'FM000'),'JK006','WM002','KOSONG');
insert into kamar values('KM'||to_char(kamar_seq.nextval,'FM000'),'JK006','WM002','KOSONG');
insert into kamar values('KM'||to_char(kamar_seq.nextval,'FM000'),'JK006','WM002','KOSONG');
insert into kamar values('KM'||to_char(kamar_seq.nextval,'FM000'),'JK002','WM003','KOSONG');

CREATE SEQUENCE fasilitas_seq
MINVALUE 1
START WITH 1
INCREMENT BY 1
CACHE 10;

insert into fasilitas values('FA'||to_char(fasilitas_seq.nextval,'FM000'),'JK001','Spring Bed','2100000');
insert into fasilitas values('FA'||to_char(fasilitas_seq.nextval,'FM000'),'JK001','Kipas Angin','160000');
insert into fasilitas values('FA'||to_char(fasilitas_seq.nextval,'FM000'),'JK004','Kipas Angin','160000');
insert into fasilitas values('FA'||to_char(fasilitas_seq.nextval,'FM000'),'JK002','TV','2500000');
insert into fasilitas values('FA'||to_char(fasilitas_seq.nextval,'FM000'),'JK002','Spring Bed','2100000');
insert into fasilitas values('FA'||to_char(fasilitas_seq.nextval,'FM000'),'JK003','Spring Bed','2100000');
insert into fasilitas values('FA'||to_char(fasilitas_seq.nextval,'FM000'),'JK004','Spring Bed','2100000');
insert into fasilitas values('FA'||to_char(fasilitas_seq.nextval,'FM000'),'JK005','Spring Bed','2100000');
insert into fasilitas values('FA'||to_char(fasilitas_seq.nextval,'FM000'),'JK006','Spring Bed','2100000');
insert into fasilitas values('FA'||to_char(fasilitas_seq.nextval,'FM000'),'JK003','TV','2500000');
insert into fasilitas values('FA'||to_char(fasilitas_seq.nextval,'FM000'),'JK005','TV','2500000');
insert into fasilitas values('FA'||to_char(fasilitas_seq.nextval,'FM000'),'JK006','AC','3000000');
insert into fasilitas values('FA'||to_char(fasilitas_seq.nextval,'FM000'),'JK006','TV','2500000');

CREATE SEQUENCE transaksi_sewakamar_seq
MINVALUE 1
START WITH 1
INCREMENT BY 1
CACHE 10;

insert into transaksi_sewakamar values(
  'TR'||to_char(transaksi_sewakamar_seq.nextval,'FM000'),'TA001','PE002', 
  to_date('10-10-2015','dd-mm-yyyy'),'3',to_date('11-10-2015','dd-mm-yyyy'),
  to_date('14-10-2015','dd-mm-yyyy'),to_date('11-10-2015','dd-mm-yyyy'),'0');
insert into transaksi_sewakamar values(
  'TR'||to_char(transaksi_sewakamar_seq.nextval,'FM000'),'TA002','PE001', to_date('29-01-2014','dd-mm-yyyy'),'4',to_date('29-01-2014','dd-mm-yyyy'),to_date('02-02-2014','dd-mm-yyyy'),to_date('29-01-2014','dd-mm-yyyy'),'0');
insert into transaksi_sewakamar values(
  'TR'||to_char(transaksi_sewakamar_seq.nextval,'FM000'),'TA003','PE002', to_date('11-02-2013','dd-mm-yyyy'),'1',to_date('11-02-2013','dd-mm-yyyy'),to_date('12-02-2013','dd-mm-yyyy'),to_date('12-02-2013','dd-mm-yyyy'),'0');
insert into transaksi_sewakamar values(
  'TR'||to_char(transaksi_sewakamar_seq.nextval,'FM000'),'TA004','PE003', to_date('08-08-2014','dd-mm-yyyy'),'2',to_date('08-08-2014','dd-mm-yyyy'),to_date('10-08-2014','dd-mm-yyyy'),to_date('10-08-2014','dd-mm-yyyy'),'0');
insert into transaksi_sewakamar values(
  'TR'||to_char(transaksi_sewakamar_seq.nextval,'FM000'),'TA005','PE003', to_date('17-07-2013','dd-mm-yyyy'),'1',to_date('17-07-2013','dd-mm-yyyy'),to_date('18-07-2013','dd-mm-yyyy'),to_date('18-07-2013','dd-mm-yyyy'),'0');

insert into menyewa values('TR001','KM005');
insert into menyewa values('TR002','KM002');
insert into menyewa values('TR003','KM007');
insert into menyewa values('TR004','KM010');
insert into menyewa values('TR005','KM013');