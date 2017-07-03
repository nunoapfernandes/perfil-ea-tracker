package beans;

import model.Season;
import persistence.SeasonDAO;

import javax.ejb.Stateless;

@Stateless(name = "SeasonEJB")
public class SeasonBean implements SeasonBeanLocal {
    @Override
    public void save(Season season) {
        SeasonDAO.registerSeason(season);
    }

    @Override
    public Season getSeasonById(int id) {
        return SeasonDAO.getSeason(id);
    }
}
