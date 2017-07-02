package beans;

import model.Episode;

/**
 * Created by RicardoFerreira on 01/07/2017.
 */
public interface EpisodeBeanLocal {
    void save(Episode episode);
    Episode getEpisodeById(int id);
}
