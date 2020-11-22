-- Table: public.Departments

-- DROP TABLE public."Departments";

CREATE TABLE public."Departments"
(
    dept_no character varying(10) COLLATE pg_catalog."default" NOT NULL,
    dept_name character varying(50) COLLATE pg_catalog."default",
    CONSTRAINT "Departments_pkey" PRIMARY KEY (dept_no)
)

TABLESPACE pg_default;

ALTER TABLE public."Departments"
    OWNER to postgres;
	
	-- Table: public.dept_emp

-- DROP TABLE public.dept_emp;

CREATE TABLE public.dept_emp
(
    emp_no integer,
    dept_no character(5) COLLATE pg_catalog."default"
)

TABLESPACE pg_default;

ALTER TABLE public.dept_emp
    OWNER to postgres;
	
	
	-- Table: public.dept_manager

-- DROP TABLE public.dept_manager;

CREATE TABLE public.dept_manager
(
    dept_no character(5) COLLATE pg_catalog."default",
    emp_no integer,
    CONSTRAINT fk_dept_no FOREIGN KEY (dept_no)
        REFERENCES public."Departments" (dept_no) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT fk_emp_no FOREIGN KEY (emp_no)
        REFERENCES public.employees (emp_no) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE public.dept_manager
    OWNER to postgres;
	
-- Table: public.employees

-- DROP TABLE public.employees;

CREATE TABLE public.employees
(
    emp_no integer NOT NULL,
    emp_title_id character(5) COLLATE pg_catalog."default",
    birth_date date,
    first_name character varying(100) COLLATE pg_catalog."default",
    last_name character varying(100) COLLATE pg_catalog."default",
    sex "char",
    hire_date date,
    CONSTRAINT employees_pkey PRIMARY KEY (emp_no),
    CONSTRAINT fk_emp_tite_id FOREIGN KEY (emp_title_id)
        REFERENCES public.titles (title_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE public.employees
    OWNER to postgres;
	
-- Table: public.salaries

-- DROP TABLE public.salaries;

CREATE TABLE public.salaries
(
    emp_no integer NOT NULL,
    salaries numeric(10,2),
    CONSTRAINT salaries_pkey PRIMARY KEY (emp_no),
    CONSTRAINT fk_emp_no FOREIGN KEY (emp_no)
        REFERENCES public.employees (emp_no) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE public.salaries
    OWNER to postgres;
	
	-- Table: public.titles

-- DROP TABLE public.titles;

CREATE TABLE public.titles
(
    title_id character(5) COLLATE pg_catalog."default" NOT NULL,
    title character varying(50) COLLATE pg_catalog."default",
    CONSTRAINT titles_pkey PRIMARY KEY (title_id)
)

TABLESPACE pg_default;

ALTER TABLE public.titles
    OWNER to postgres;