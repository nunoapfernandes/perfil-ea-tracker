package persistence;

import model.Season;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

public class SeasonDAO {
    private static Session session = HibernateUtil.getSessionFactory().openSession();

    public static void registerSeason(Season season){
        session.saveOrUpdate(season);
        session.getTransaction().commit();
    }

    public static Season getSeason(int seasonid){
        Query query = session.createQuery("select s from Season s where s.id_media = :seasonid");
        query.setParameter("seasonid", seasonid);
        return (Season) query.getSingleResult();
    }

}
