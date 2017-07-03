package beans;

import model.Episode;

public interface EpisodeBeanLocal {
    void save(Episode episode);
    Episode getEpisodeById(int id);
}
