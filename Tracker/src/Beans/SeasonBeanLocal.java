package Beans;

import Model.Movie;
import Model.Season;

/**
 * Created by RicardoFerreira on 01/07/2017.
 */
public interface SeasonBeanLocal {
    void save(Season season);
    Season getSeasonById(int id);
}
