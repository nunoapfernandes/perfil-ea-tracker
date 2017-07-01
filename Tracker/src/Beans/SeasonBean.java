package Beans;

import Model.Season;
import Persistence.SeasonDAO;

import javax.ejb.Stateless;

/**
 * Created by RicardoFerreira on 01/07/2017.
 */
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
