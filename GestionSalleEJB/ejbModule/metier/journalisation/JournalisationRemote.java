package metier.journalisation;

import java.util.List;

import javax.ejb.Remote;

import metier.entities.Journalisation;

@Remote
public interface JournalisationRemote {
	List<Journalisation> getJournalisationSalle();
	List<Journalisation> getJournalisationFiliere();
}
