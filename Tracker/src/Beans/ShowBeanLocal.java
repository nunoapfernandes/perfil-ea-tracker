package Beans;

import Model.Season;
import Model.Show;

/**
 * Created by RicardoFerreira on 01/07/2017.
 */
public interface ShowBeanLocal {
    void save(Show show);
    Show getShowById(int id);
}
