-- CREATE TABLE tbl_user (
--     id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
--     username VARCHAR(128) NOT NULL,
--     password VARCHAR(128) NOT NULL,
--     email VARCHAR(128) NOT NULL
-- );

INSERT INTO tbl_modeltype (name) VALUES ('Astrophysical Models');
INSERT INTO tbl_modeltype (name) VALUES ('Cosmological Models');
INSERT INTO tbl_modeltype (name) VALUES ('Experimental Limits');
INSERT INTO tbl_modeltype (name) VALUES ('Projected sensitivities');

INSERT INTO tbl_spectrum (name, func_name, type_id, para_num) VALUES ('Magnetar Model', 'Mag_Model', 1, 5);
INSERT INTO tbl_parameter (name, detail, spectrum_id, value, variable) VALUES ('B-Field', '[7e13G, 1e17G]:', 1, '1E+15', 'B');
INSERT INTO tbl_parameter (name, detail, spectrum_id, value, variable) VALUES ('ε', '(ellipticity) [1e-6 - 1e-2]:', 1, '0.0002','eps');
INSERT INTO tbl_parameter (name, detail, spectrum_id, value, variable) VALUES ('P0', '(rot period) [1e-3s,5e-3s]:', 1, '0.001','P0');
INSERT INTO tbl_parameter (name, detail, spectrum_id, value, variable) VALUES ('λ', '(mass fraction) [1e-4MΘ-1, 1e-2MΘ-1]:', 1, '0.001','lamb');
INSERT INTO tbl_parameter (name, detail, spectrum_id, value, variable) VALUES ('Iz', '(moment of inertia) [in g·cm2]:', 1, '1E+45','Iz');
INSERT INTO tbl_reference (spectrum_id, name, file) VALUES (1, 'Short Intro to Magnetar Model', 'IntroToNS_mag.pdf');
INSERT INTO tbl_reference (spectrum_id, name) VALUES (1, 'arXiv:0806.2794v1[astro-ph]');


INSERT INTO tbl_spectrum (name, type_id, para_num) VALUES ('Double Neutron Star Model', 1, 2);
INSERT INTO tbl_parameter (name, detail, spectrum_id, value, variable) VALUES ('M', '(chirp mass) [1MΘ, 2.5MΘ]:', 2, '1.22','M');
INSERT INTO tbl_parameter (name, detail, spectrum_id, value, variable) VALUES ('λ', '(mass fraction) [0, 1MΘ-1]：', 2, '3E-0','lamb');
INSERT INTO tbl_reference (spectrum_id, name) VALUES (2, 'Short Intro to  DNS');
INSERT INTO tbl_reference (spectrum_id, name) VALUES (2, 'arXiv:0806.2794v1[astro-ph]');


INSERT INTO tbl_spectrum (name, type_id, para_num) VALUES ('Double black holes Modell', 1, 2);
INSERT INTO tbl_parameter (name, detail, spectrum_id, value, variable) VALUES ('M', '(chirp mass) [1MΘ, 2.5MΘ]:', 3, '8.7','M');
INSERT INTO tbl_parameter (name, detail, spectrum_id, value, variable) VALUES ('λ', '(mass fraction) [0, 1MΘ-1]：', 3, '0.01','lamb');
INSERT INTO tbl_reference (spectrum_id, name) VALUES (2, 'Short Intro to BBH');
INSERT INTO tbl_reference (spectrum_id, name) VALUES (2, 'arXiv:1104.3565v2 [gr-qc]');


INSERT INTO tbl_spectrum (name, type_id, para_num) VALUES ('NS-BH Model', 1, 2);
INSERT INTO tbl_parameter (name, detail, spectrum_id, value, variable) VALUES ('M', '(chirp mass) [1MΘ, 2.5MΘ]:', 4, '8.7','M');
INSERT INTO tbl_parameter (name, detail, spectrum_id, value, variable) VALUES ('λ', '(mass fraction) [0, 1MΘ-1]：', 4, '0.01','lamb');
INSERT INTO tbl_reference (spectrum_id, name) VALUES (3, 'Short Intro to NSBH');
INSERT INTO tbl_reference (spectrum_id, name) VALUES (3, 'arXiv:1105.3565v2 [gr-qc]');

INSERT INTO tbl_spectrum (name, type_id, para_num) VALUES ('r-mode Model', 1, 2);
INSERT INTO tbl_parameter (name, detail, spectrum_id, value, variable) VALUES ('P0', '(period) [0.5ms, 10ms]:', 5, '1','P0');
INSERT INTO tbl_parameter (name, detail, spectrum_id, value, variable) VALUES ('λ', '(mass fraction) [0, 1e-2MΘ-1]:', 5, '1E-05','lamb');
INSERT INTO tbl_reference (spectrum_id, name) VALUES (3, 'Short Intro to r-mode');


INSERT INTO tbl_spectrum (name, type_id, para_num) VALUES ('bar-mode Model', 1, 2);
INSERT INTO tbl_parameter (name, detail, spectrum_id, value, variable) VALUES ('P0', '(period) [0.5ms, 10ms]:', 6, '1','P0');
INSERT INTO tbl_parameter (name, detail, spectrum_id, value, variable) VALUES ('λ', '(mass fraction) [0, 1e-2MΘ-1]:', 6, '1E-07','lamb');

INSERT INTO tbl_spectrum (name, type_id, para_num) VALUES ('Neutron Star Turbulence Model', 1, 5);
INSERT INTO tbl_parameter (name, detail, spectrum_id, value, variable) VALUES ('d0m', '(Crust core differential shear) [1e-4,1e3]:', 7, '100','d0m');
INSERT INTO tbl_parameter (name, detail, spectrum_id, value, variable) VALUES ('N', '(NS Fraction) [1e-6,1]:', 7, '1','N');
INSERT INTO tbl_parameter (name, detail, spectrum_id, value, variable) VALUES ('v', '(kinematic viscosity) [0.1,10]:', 7, '1','v');
INSERT INTO tbl_parameter (name, detail, spectrum_id, value, variable) VALUES ('M_star', '(NS mass) [1MΘ,2MΘ]:', 7, '1.4','M');
INSERT INTO tbl_parameter (name, detail, spectrum_id, value, variable) VALUES ('R_star', '(NS radius) [7km,20km]:', 7, '10','R');

INSERT INTO tbl_spectrum (name, type_id, para_num) VALUES ('Inflation Model', 2, 0);

INSERT INTO tbl_spectrum (name, type_id, para_num) VALUES ('Pre-Big-Bang Model', 2, 3);
INSERT INTO tbl_parameter (name, detail, spectrum_id, value, variable) VALUES ('μ', '(0, 2]:', 9, '1.5', 'mu');
INSERT INTO tbl_parameter (name, detail, spectrum_id, value, variable) VALUES ('F1', '[1e8, 1e11]:', 9, '1E10', 'F1');
INSERT INTO tbl_parameter (name, detail, spectrum_id, value, variable) VALUES ('Fs', '[1, 1e11]:', 9, '100', 'Fs');

INSERT INTO tbl_spectrum (name, type_id, para_num) VALUES ('Cosmic String Model', 2, 3);
INSERT INTO tbl_parameter (name, detail, spectrum_id, value, variable) VALUES ('P', '(probability)[1e-3, 1]:', 10, '0.01', 'P');
INSERT INTO tbl_parameter (name, detail, spectrum_id, value, variable) VALUES ('ε', '(size)[1e-13, 1]:', 10, '1E-10', 'eps');
INSERT INTO tbl_parameter (name, detail, spectrum_id, value, variable) VALUES ('Gμ', '[1e-12,1e-6]:', 10, '1E-06', 'Gmu');

INSERT INTO tbl_spectrum (name, type_id, para_num) VALUES ('Axion Inflation Model', 2, 3);
INSERT INTO tbl_parameter (name, detail, spectrum_id, value, variable) VALUES ('p', '(potential form) 1 or 2:', 11, '2', 'p');
INSERT INTO tbl_parameter (name, detail, spectrum_id, value, variable) VALUES ('ξcmb', '; (ξ at Φcmb)[1.2 2.7]:', 11, '2.4', 'epscmb');
INSERT INTO tbl_parameter (name, detail, spectrum_id, value, variable) VALUES ('Ncmb', '(Number of e-foldings)[45 65]:', 11, '58', 'Ncmb');

INSERT INTO tbl_spectrum (name, func_name, type_id, para_num) VALUES ('COBE', 'COBE', 3, 0);
INSERT INTO tbl_spectrum (name, func_name, type_id, para_num) VALUES ('Pulsar Timing', 'Pulsar_Timing', 3, 0);
INSERT INTO tbl_spectrum (name, func_name, type_id, para_num) VALUES ('LIGO S3', 'LIGO_S3', 3, 0);
INSERT INTO tbl_spectrum (name, func_name, type_id, para_num) VALUES ('LIGO S4', 'LIGO_S4', 3, 0);
INSERT INTO tbl_spectrum (name, func_name, type_id, para_num) VALUES ('LIGO S5', 'LIGO_S5', 3, 0);
INSERT INTO tbl_spectrum (name, func_name, type_id, para_num) VALUES ('BBN', 'BBN', 3, 0);
INSERT INTO tbl_spectrum (name, func_name, type_id, para_num) VALUES ('CMB+LSS', 'CMB_LSS', 3, 0);

INSERT INTO tbl_spectrum (name, func_name, type_id, para_num) VALUES ('Advanced LIGO', 'Advan_LIGO', 4,0 );
INSERT INTO tbl_spectrum (name, func_name, type_id, para_num) VALUES ('LISA', 'LISA', 4, 0);
INSERT INTO tbl_spectrum (name, func_name, type_id, para_num) VALUES ('Planck Projection', 'Planck_Proj', 4,0 );



INSERT INTO tbl_sfrate (name, sf_para) VALUES ('Hopkins & Beacom 2006', "'h'");
INSERT INTO tbl_sfrate (name, sf_para) VALUES ('Fardal 2007', "'f'");
INSERT INTO tbl_sfrate (name, sf_para) VALUES ('Wilken 2008', "'w'");
INSERT INTO tbl_sfrate (name, sf_para) VALUES ('Nagamine et al. 2006 (fossil model)', "'n'");
INSERT INTO tbl_sfrate (name, sf_para) VALUES ('Springel & Hernquist 2003', "'s'");

INSERT INTO tbl_color (name, value)  VALUES ('green', 'g');
INSERT INTO tbl_color (name, value)  VALUES ('white', 'w');
INSERT INTO tbl_color (name, value)  VALUES ('black', 'k');
INSERT INTO tbl_color (name, value)  VALUES ('red', 'r');
INSERT INTO tbl_color (name, value)  VALUES ('cyan', 'c');
INSERT INTO tbl_color (name, value)  VALUES ('magenta', 'm');
INSERT INTO tbl_color (name, value)  VALUES ('yellow', 'y');
INSERT INTO tbl_color (name, value)  VALUES ('Blue', 'b');

INSERT INTO tbl_linestyle (name, value)  VALUES ('Solid', '-');
INSERT INTO tbl_linestyle (name, value)  VALUES ('Dashed', '--');
INSERT INTO tbl_linestyle (name, value)  VALUES ('Dotted', ':');
INSERT INTO tbl_linestyle (name, value)  VALUES ('Dash-dot', '-.');