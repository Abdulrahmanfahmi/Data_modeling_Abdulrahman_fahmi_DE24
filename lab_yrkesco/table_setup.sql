CREATE TABLE "Anläggning" (
  "company_id" int,
  "anläggning_id" int,
  "ort" varchar(50),
  PRIMARY KEY ("company_id", "anläggning_id")
);

CREATE TABLE "Utbidningsledare" (
  "utbildningsledare_id" int,
  "first_name" Varchar(50),
  "last_name" varchar(50),
  "email" varchar(50),
  PRIMARY KEY ("utbildningsledare_id")
);

CREATE TABLE "Program" (
  "program_id" int,
  "program_name" varchar(100),
  "start_date " Date,
  "end_date" Date,
  "creadits" int,
  "description" Text,
  PRIMARY KEY ("program_id")
);

CREATE TABLE "Klass" (
  "klass_id" int,
  "program_id" int,
  "utbildningsledare_id" int,
  "max_capacity" int,
  PRIMARY KEY ("klass_id"),
  CONSTRAINT "FK_Klass.utbildningsledare_id"
    FOREIGN KEY ("utbildningsledare_id")
      REFERENCES "Utbidningsledare"("utbildningsledare_id"),
  CONSTRAINT "FK_Klass.program_id"
    FOREIGN KEY ("program_id")
      REFERENCES "Program"("program_id")
);

CREATE TABLE "Student" (
  "student_id" int,
  "first_name" varchar(50),
  "last_name" varchar(50),
  "personal_number" varchar(12),
  "email" varchar(100),
  "phone_number" varchar(20),
  "address" varchar(100),
  "birth_date" Date,
  "klass_id" int,
  PRIMARY KEY ("student_id"),
  CONSTRAINT "FK_Student.klass_id"
    FOREIGN KEY ("klass_id")
      REFERENCES "Klass"("klass_id")
);

CREATE TABLE "Company" (
  "company_id" int,
  "company_org_number" varchar(20),
  "address" varchar(255),
  "hourly_rate" decimal(10,2),
  "has_f_skatt" boolean, 
  PRIMARY KEY ("company_id"),
  CONSTRAINT "FK_Company.company_id"
    FOREIGN KEY ("company_id")
      REFERENCES "Anläggning"("company_id")
);

CREATE TABLE "Kurs" (
  "kurs_id" int,
  "kurs_namn" varchar(100),
  "start_date" Date,
  "end_date" Date,
  "creadits" int,
  "description" Text,
  PRIMARY KEY ("kurs_id")
);

CREATE TABLE "Utbildare" (
  "utbildare_id" int,
  "first_name" varchar(50),
  "last_name" varchar(50),
  "email" varchar(100),
  "is_consult" Boolean,
  "company_id" int,
  "hourly_rate" decimal,
  PRIMARY KEY ("utbildare_id"),
  CONSTRAINT "FK_Utbildare.company_id"
    FOREIGN KEY ("company_id")
      REFERENCES "Company"("company_id")
);

CREATE TABLE "utbildare_kurs" (
  "utbildare_id" int,
  "kurs_id" int,
  CONSTRAINT "FK_utbildare_kurs.kurs_id"
    FOREIGN KEY ("kurs_id")
      REFERENCES "Kurs"("kurs_id"),
  CONSTRAINT "FK_utbildare_kurs.utbildare_id"
    FOREIGN KEY ("utbildare_id")
      REFERENCES "Utbildare"("utbildare_id")
);

CREATE TABLE "program_kurs" (
  "program_id" int,
  "kurs_id" int,
  "start_date" <type>,
  "end_date" <type>,
  CONSTRAINT "FK_program_kurs.program_id"
    FOREIGN KEY ("program_id")
      REFERENCES "Program"("program_id"),
  CONSTRAINT "FK_program_kurs.kurs_id"
    FOREIGN KEY ("kurs_id")
      REFERENCES "Kurs"("kurs_id")
);

