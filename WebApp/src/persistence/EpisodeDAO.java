package persistence;

import model.Episode;
import org.hibernate.Session;
import org.hibernate.query.Query;

public class EpisodeDAO {
    private static Session session = HibernateUtil.getSessionFactory().openSession();

    public static void registerEpisode(Episode episode){
        session.saveOrUpdate(episode);
        session.getTransaction().commit();
    }

    public static Episode getEpisode(int episodeid){
        Query query = session.createQuery("select e from Episode e where e.id_media = :episodeid");
        query.setParameter("episodeid", episodeid);
        return (Episode) query.getSingleResult();
    }
}
