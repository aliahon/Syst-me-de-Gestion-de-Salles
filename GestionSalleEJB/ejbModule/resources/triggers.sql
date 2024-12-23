-- Trigger pour INSERT Salle
CREATE TRIGGER after_salle_insert AFTER INSERT ON salle FOR EACH ROW INSERT INTO journalisation (table_name, operation_type, record_id, details, operation_time) VALUES ('salle', 'Ajout', NEW.id, CONCAT('Ajout salle : ', NEW.id, ', localisation: ', NEW.localisation), NOW());


-- Trigger pour DELETE Salle
CREATE TRIGGER after_salle_delete AFTER DELETE ON salle FOR EACH ROW INSERT INTO journalisation (table_name, operation_type, record_id,details, operation_time) VALUES ('salle', 'Suppression', OLD.id, CONCAT('Salle supprimé : ', OLD.id), NOW());

-- Trigger pour INSERT Filiere
CREATE TRIGGER after_filiere_insert AFTER INSERT ON filiere FOR EACH ROW INSERT INTO journalisation (table_name, operation_type, record_id, details, operation_time) VALUES ('filiere', 'Ajout', NEW.id, CONCAT('Ajout filiere : ', NEW.nom, ', effectif: ', NEW.effectif), NOW());


-- Trigger pour DELETE Filiere
CREATE TRIGGER after_filiere_delete AFTER DELETE ON filiere FOR EACH ROW INSERT INTO journalisation (table_name, operation_type, record_id,details, operation_time) VALUES ('filiere', 'Suppression', OLD.id, CONCAT('Filiere supprimé : ', OLD.nom , ', effectif: ', OLD.effectif), NOW());

--events

CREATE EVENT IF NOT EXISTS cleanup_old_reservations ON SCHEDULE EVERY 1 DAY STARTS CURRENT_TIMESTAMP DO DELETE FROM reservation WHERE id IN (SELECT r.id FROM reservation r JOIN creneau c ON r.creneau_reserve_id = c.id WHERE c.dateDebut < CURDATE());

CREATE EVENT IF NOT EXISTS cleanup_old_creneaux ON SCHEDULE EVERY 1 DAY STARTS CURRENT_TIMESTAMP DO DELETE FROM creneau WHERE dateDebut < CURDATE() AND id NOT IN (SELECT DISTINCT creneau_reserve_id FROM reservation);


--creation de la base de donnée initiale
--utilisateurs
INSERT INTO `utilisateur` (`id`, `email`, `nom`, `password`, `role`) VALUES (NULL, 'h.bouzahir@uiz.ac.ma', 'Hassane Bouzahir', '0000', 'PROF');
INSERT INTO `utilisateur` (`id`, `email`, `nom`, `password`, `role`) VALUES (NULL, 'h.aksasse@uiz.ac.ma', 'Hamid Aksasse', '1111', 'CF');
INSERT INTO `utilisateur` (`id`, `email`, `nom`, `password`, `role`) VALUES (NULL, 'm.harim@uiz.ac.ma', 'Mustafa Harim', '2222', 'RS');

--salle
INSERT INTO `salle` (`id`, `localisation`, `nature`, `nbplace`) VALUES ('H11', 'Batiment H, 1er étage', 'Cours', '80');
INSERT INTO `salle` (`id`, `localisation`, `nature`, `nbplace`) VALUES ('F12', 'Batiment F, 3eme étage', 'Cours', '60');
INSERT INTO `salle` (`id`, `localisation`, `nature`, `nbplace`) VALUES ('K2', 'Batiment K, 1er étage', 'TP_Info', '30');
