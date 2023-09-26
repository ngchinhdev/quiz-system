create database quiz_system;

use quiz_system;

create table vai_tro(
    ma_vai_tro int(4) primary key not null AUTO_INCREMENT,
    loai_vai_tro varchar(50) not null
);

create table nguoi_dung(
    ma_nguoi_dung int(10) primary key not null AUTO_INCREMENT,
    ten_nguoi_dung varchar(50) not null,
    email varchar(50) not null,
    hinh_anh varchar(150) not null,
    ma_vai_tro int(4) not null,
    foreign key (ma_vai_tro) references vai_tro(ma_vai_tro)
);

create table phan_hoi(
    ma_phan_hoi int(10) primary key not null AUTO_INCREMENT,
    noi_dung varchar(200) not null,
    thoi_diem timestamp default current_timestamp(),
    ma_nguoi_dung int(10) not null,
    foreign key (ma_nguoi_dung) references nguoi_dung(ma_nguoi_dung)
);

create table de(
    ma_de int(5) primary key not null AUTO_INCREMENT,
    loai int(1) not null,
    ten_de varchar(50) not null,
    bo_de varchar(50) not null,
    cap_do varchar(50),
    thoi_diem_tao timestamp default current_timestamp(),
    thoi_gian_lam_bai int(10) not null,
    nguoi_tham_gia int(10) not null
);

create table cau_hoi(
    ma_cau_hoi int(10) primary key not null AUTO_INCREMENT,
    noi_dung varchar(200) not null,
    giai_thich varchar(250) not null,
    ma_de int(5) not null,
    foreign key (ma_de) references de(ma_de)
);

create table dap_an(
    ma_dap_an int(10) primary key not null AUTO_INCREMENT,
    noi_dung varchar(100) not null,
    dap_an_dung int(1) not null,
    ma_cau_hoi int(10) not null,
    foreign key (ma_cau_hoi) references cau_hoi(ma_cau_hoi)
);

create table lich_su_lam_bai(
    ma_lich_su int(10) primary key not null AUTO_INCREMENT,
    thoi_gian_lam int(10) not null,
    thoi_diem timestamp default current_timestamp(),
    diem_so int(2) not null,
    ma_nguoi_dung int(10) not null,
    ma_de int(5) not null,
    foreign key (ma_nguoi_dung) references nguoi_dung(ma_nguoi_dung),
    foreign key (ma_de) references de(ma_de)
);

create table dap_an_chon(
    id int(10) primary key AUTO_INCREMENT,
    dap_an_chon int(1) not null,
    ma_lich_su int(10) not null,
    ma_cau_hoi int(10) not null,
    foreign key (ma_lich_su) references lich_su_lam_bai(ma_lich_su), 
    foreign key (ma_cau_hoi) references cau_hoi(ma_cau_hoi)
);