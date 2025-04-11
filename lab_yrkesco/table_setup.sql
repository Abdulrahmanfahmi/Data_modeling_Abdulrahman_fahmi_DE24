CREATE TABLE "Anläggning" (
  "company_id" int,
  "anläggning_id" int,
  "ort" varchar(50),
  PRIMARY KEY ("company_id", "anläggning_id")
);

CREATE TABLE "Utbildningsledare" (
  "utbildningsledare_id" int,
  "first_name" varchar(50),
  "last_name" varchar(50),
  "email" varchar(50),
  PRIMARY KEY ("utbildningsledare_id")
);

CREATE TABLE "Program" (
  "program_id" int,
  "program_name" varchar(100),
  "start_date" date,
  "end_date" date,
  "credits" int,
  "description" text,
  PRIMARY KEY ("program_id")
);

CREATE TABLE "Klass" (
  "klass_id" int,
  "program_id" int,
  "utbildningsledare_id" int,
  "max_capacity" int,
  PRIMARY KEY ("klass_id"),
  CONSTRAINT "FK_Klass_utbildningsledare_id"
    FOREIGN KEY ("utbildningsledare_id") REFERENCES "Utbildningsledare"("utbildningsledare_id"),
  CONSTRAINT "FK_Klass_program_id"
    FOREIGN KEY ("program_id") REFERENCES "Program"("program_id")
);

CREATE TABLE "Student" (
  "student_id" int,
  "first_name" varchar(50),
  "last_name" varchar(50),
  "personal_number" varchar(12),
  "email" varchar(100),
  "phone_number" varchar(20),
  "address" varchar(100),
  "birth_date" date,
  "klass_id" int,
  PRIMARY KEY ("student_id"),
  CONSTRAINT "FK_Student_klass_id"
    FOREIGN KEY ("klass_id") REFERENCES "Klass"("klass_id")
);

CREATE TABLE "Company" (
  "company_id" int,
  "company_org_number" varchar(20),
  "address" varchar(255),
  "hourly_rate" decimal(10,2),
  "has_f_skatt" boolean,
  PRIMARY KEY ("company_id")
  
);

CREATE TABLE "Kurs" (
  "kurs_id" int,
  "kurs_namn" varchar(100),
  "start_date" date,
  "end_date" date,
  "credits" int,
  "description" text,
  PRIMARY KEY ("kurs_id")
);

CREATE TABLE "Utbildare" (
  "utbildare_id" int,
  "first_name" varchar(50),
  "last_name" varchar(50),
  "email" varchar(100),
  "is_consult" boolean,
  "company_id" int,
  "hourly_rate" decimal(10,2),
  PRIMARY KEY ("utbildare_id"),
  CONSTRAINT "FK_Utbildare_company_id"
    FOREIGN KEY ("company_id") REFERENCES "Company"("company_id")
);

CREATE TABLE "utbildare_kurs" (
  "utbildare_id" int,
  "kurs_id" int,
  PRIMARY KEY ("utbildare_id", "kurs_id"),
  CONSTRAINT "FK_utbildare_kurs_kurs_id"
    FOREIGN KEY ("kurs_id") REFERENCES "Kurs"("kurs_id"),
  CONSTRAINT "FK_utbildare_kurs_utbildare_id"
    FOREIGN KEY ("utbildare_id") REFERENCES "Utbildare"("utbildare_id")
);

CREATE TABLE "program_kurs" (
  "program_id" int,
  "kurs_id" int,
  "start_date" date,
  "end_date" date,
  PRIMARY KEY ("program_id", "kurs_id"),
  CONSTRAINT "FK_program_kurs_program_id"
    FOREIGN KEY ("program_id") REFERENCES "Program"("program_id"),
  CONSTRAINT "FK_program_kurs_kurs_id"
    FOREIGN KEY ("kurs_id") REFERENCES "Kurs"("kurs_id")
);
