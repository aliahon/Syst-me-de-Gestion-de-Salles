-- Trigger pour INSERT Salle
CREATE TRIGGER after_salle_insert AFTER INSERT ON salle FOR EACH ROW INSERT INTO journalisation (table_name, operation_type, record_id, details, operation_time) VALUES ('salle', 'Ajout', NEW.id, CONCAT('Ajout salle : ', NEW.id, ', localisation: ', NEW.localisation), NOW());


-- Trigger pour DELETE Salle
CREATE TRIGGER after_salle_delete AFTER DELETE ON salle FOR EACH ROW INSERT INTO journalisation (table_name, operation_type, record_id,details, operation_time) VALUES ('salle', 'Suppression', OLD.id, CONCAT('Salle supprimé : ', OLD.id), NOW());

-- Trigger pour INSERT Filiere
CREATE TRIGGER after_filiere_insert AFTER INSERT ON filiere FOR EACH ROW INSERT INTO journalisation (table_name, operation_type, record_id, details, operation_time) VALUES ('filiere', 'Ajout', NEW.id, CONCAT('Ajout filiere : ', NEW.nom, ', effectif: ', NEW.effectif), NOW());


-- Trigger pour DELETE Filiere
CREATE TRIGGER after_filiere_delete AFTER DELETE ON filiere FOR EACH ROW INSERT INTO journalisation (table_name, operation_type, record_id,details, operation_time) VALUES ('filiere', 'Suppression', OLD.id, CONCAT('Filiere supprimé : ', OLD.nom , ', effectif: ', OLD.effectif), NOW());
