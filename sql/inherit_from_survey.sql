-- FUNCTION: public.inherit_from_survey(integer, integer)

-- DROP FUNCTION IF EXISTS public.inherit_from_survey(integer, integer);

CREATE OR REPLACE FUNCTION public.inherit_from_survey(
	id_of_survey_to_inherit_from integer,
	id_of_survey_which_inherits integer)
    RETURNS TABLE(inserted_cqa_id integer, new_parent_id_for_inserted_cqa integer) 
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE PARALLEL UNSAFE
    ROWS 1000

AS $BODY$
<< outerblock >>

BEGIN

DROP TABLE IF EXISTS choice_question_answers_to_inherit;
CREATE /*TEMPORARY*/ TABLE choice_question_answers_to_inherit /*ON COMMIT drop*/ AS

  
  SELECT cqa.id, cqa.survey_id, cqa.question, cqa.linked_survey_id, cqa.answer, cqa.parent_id
  FROM public.choice_question_answer cqa
  WHERE cqa.survey_id = id_of_survey_to_inherit_from and cqa.parent_id IS NULL; 
  
  INSERT INTO public.choice_question_answer (survey_id, question, linked_survey_id, answer, parent_id)
  SELECT id_of_survey_which_inherits, to_inherit.question, to_inherit.survey_id, to_inherit.answer, to_inherit.parent_id
  FROM choice_question_answers_to_inherit to_inherit;

/*
DROP TABLE IF EXISTS new_choice_question_answers;
CREATE /*TEMPORARY*/ TABLE new_choice_question_answers /*ON COMMIT drop*/ AS
WITH new_choice_question_answers_cte AS (
  INSERT INTO public.choice_question_answer (survey_id, question, linked_survey_id, answer, parent_id)
  SELECT new_survey.id, cqa.question, cqa.linked_survey_id, cqa.answer, cqa.parent_id
  FROM old_choice_question_answers cqa
  CROSS JOIN new_survey -- joins with newly created survey (to get the newly created ID) Cross join because we dont need to specify something to join on because there is exactly one row in new_survey
  RETURNING id, survey_id, question, linked_survey_id, answer, parent_id 
) SELECT * FROM new_choice_question_answers_cte; 

DROP TABLE IF EXISTS choice_question_answers_child_joined_with_old_parent;
CREATE /*TEMPORARY*/ TABLE choice_question_answers_child_joined_with_old_parent /*ON COMMIT drop*/ AS

   SELECT new_cqa.id, new_cqa.survey_id, new_cqa.question, new_cqa.linked_survey_id, new_cqa.answer, new_cqa.parent_id,
	     old_parent_cqa.id as old_parent_id, old_parent_cqa.survey_id as old_parent_survey_id, old_parent_cqa.question as old_parent_question, old_parent_cqa.linked_survey_id as old_parent_linked_survey_id, old_parent_cqa.answer as old_parent_answer, old_parent_cqa.parent_id as old_parent_parent_id  --new_survey.id, cqa.id, cqa.question, new_survey.id, cqa.answer, cqa.parent_id, old_cqa.id, old_cqa.survey_id, old_cqa.question, old_cqa.answer, old_cqa.parent_id
  FROM new_choice_question_answers new_cqa
 
  JOIN public.choice_question_answer old_parent_cqa on new_cqa.parent_id = old_parent_cqa.id; 

DROP TABLE IF EXISTS old_parent_joined_with_new_parent;
CREATE /*TEMPORARY*/ TABLE old_parent_joined_with_new_parent /*ON COMMIT drop*/ AS
   SELECT old_parent.id, old_parent.survey_id, old_parent.question, old_parent.linked_survey_id, old_parent.answer, old_parent.parent_id,
	     old_parent_id, old_parent_survey_id, old_parent_question, old_parent_linked_survey_id, old_parent_answer, old_parent_parent_id,
	     new_parent.id as joined_new_parent_id, new_parent.survey_id as joined_new_parent_survey_id, new_parent.question as joined_new_parent_question, new_parent.linked_survey_id as joined_new_parent_linked_survey_id, new_parent.answer as joined_new_parent_answer, new_parent.parent_id as joined_new_parent_parent_id 
   FROM choice_question_answers_child_joined_with_old_parent old_parent
   JOIN new_choice_question_answers new_parent  on new_parent.question = old_parent.old_parent_question  and new_parent.linked_survey_id = old_parent.old_parent_linked_survey_id  and new_parent.answer = old_parent.old_parent_answer   and new_parent.parent_id IS NOT DISTINCT FROM old_parent.old_parent_parent_id; 

UPDATE choice_question_answer
SET parent_id = joined_new_parent_id
FROM old_parent_joined_with_new_parent
WHERE choice_question_answer.id =  old_parent_joined_with_new_parent.id;
 
DROP TABLE IF EXISTS new_joined_with_old_choice_question_answers;
CREATE /*TEMPORARY*/ TABLE new_joined_with_old_choice_question_answers /*ON COMMIT drop*/ AS  
  SELECT new_cqa.id as new_cqa_id, new_cqa.survey_id as new_cqa_survey_id, new_cqa.question as new_cqa_question, new_cqa.linked_survey_id as new_cqa_linked_survey_id, new_cqa.answer as new_cqa_answer, new_cqa.parent_id as new_cqa_parent_id,
		 old_cqa.id as old_cqa_id, old_cqa.survey_id as old_cqa_survey_id, old_cqa.question as old_cqa_question, old_cqa.linked_survey_id as old_cqa_linked_survey_id, old_cqa.answer as old_cqa_answer, old_cqa.parent_id as old_cqa_parent_id
	FROM new_choice_question_answers new_cqa
  JOIN old_choice_question_answers old_cqa on new_cqa.question = old_cqa.question and new_cqa.linked_survey_id = old_cqa.linked_survey_id and new_cqa.answer = old_cqa.answer and new_cqa.parent_id IS NOT DISTINCT FROM old_cqa.parent_id; 

DROP TABLE IF EXISTS new_concretisations;
CREATE /*TEMPORARY*/ TABLE new_concretisations /*ON COMMIT drop*/ AS
WITH new_concretisations_cte AS (
  INSERT INTO public.concretisation (choice_question_answer_id, concretisation_value)
  SELECT old_and_new_cqa.new_cqa_id, concretisation_value
  FROM concretisation
  JOIN new_joined_with_old_choice_question_answers old_and_new_cqa on old_and_new_cqa.old_cqa_id = concretisation.choice_question_answer_id
  RETURNING id, choice_question_answer_id, order_index, concretisation_value 
)SELECT * FROM new_concretisations_cte; 

    RETURN query SELECT id, joined_new_parent_id  FROM old_parent_joined_with_new_parent;
	*/
END;
$BODY$;

ALTER FUNCTION public.inherit_from_survey(integer, integer)
    OWNER TO johr;
