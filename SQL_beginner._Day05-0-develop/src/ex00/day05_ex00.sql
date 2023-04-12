CREATE INDEX idx_menu_id ON menu 
USING btree (id);
CREATE INDEX idx_pizzeria_id ON pizzeria 
USING btree (id);
CREATE INDEX idx_person_id ON person 
USING btree (id);
CREATE INDEX idx_person_visits_id ON person_visits 
USING btree (id);
CREATE INDEX idx_person_order_id ON person_order 
USING btree (id);
