package beans;

import model.Season;

public interface SeasonBeanLocal {
    void save(Season season);
    Season getSeasonById(int id);
}
