package metier.journalisation;

import java.util.List;

import javax.ejb.Local;

import metier.entities.Journalisation;

@Local
public interface JournalisationLocal {

	List<Journalisation> getJournalisationSalle();
	List<Journalisation> getJournalisationFiliere();
}
