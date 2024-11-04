-- Table: public.choice_question_answer

-- DROP TABLE IF EXISTS public.choice_question_answer;

CREATE TABLE IF NOT EXISTS public.choice_question_answer
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    survey_id integer NOT NULL,
    question choice_question_type NOT NULL,
    linked_survey_id integer NOT NULL,
    answer choice_answer_type NOT NULL,
    parent_id integer,
    CONSTRAINT choice_question_answers_pkey PRIMARY KEY (id),
    CONSTRAINT choice_question_answer_survey_id_question_linked_survey_id__key UNIQUE (survey_id, question, linked_survey_id, answer, parent_id),
    CONSTRAINT choice_question_answer_survey_id_fkey FOREIGN KEY (survey_id)
        REFERENCES public.survey (id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE
        NOT VALID,
    CONSTRAINT choice_question_answers_parent_id_fkey FOREIGN KEY (parent_id)
        REFERENCES public.choice_question_answer (id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.choice_question_answer
    OWNER to johr;

GRANT ALL ON TABLE public.choice_question_answer TO johr;

GRANT ALL ON TABLE public.choice_question_answer TO ug_massnahmen;
-- Index: choice_question_answer_unique_without_parent_id

-- DROP INDEX IF EXISTS public.choice_question_answer_unique_without_parent_id;

CREATE UNIQUE INDEX IF NOT EXISTS choice_question_answer_unique_without_parent_id
    ON public.choice_question_answer USING btree
    (survey_id ASC NULLS LAST, question ASC NULLS LAST, linked_survey_id ASC NULLS LAST, answer ASC NULLS LAST)
    TABLESPACE pg_default
    WHERE parent_id IS NULL;