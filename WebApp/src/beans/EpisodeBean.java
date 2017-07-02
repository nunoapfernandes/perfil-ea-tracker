package beans;

import model.Episode;
import persistence.EpisodeDAO;

import javax.ejb.Stateless;

/**
 * Created by RicardoFerreira on 01/07/2017.
 */

@Stateless(name = "EpisodeEJB")
public class EpisodeBean implements EpisodeBeanLocal {
    @Override
    public void save(Episode episode) {
        EpisodeDAO.registerEpisode(episode);
    }

    @Override
    public Episode getEpisodeById(int id) {
        return EpisodeDAO.getEpisode(id);
    }
}
