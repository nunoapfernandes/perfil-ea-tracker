package persistence;

import model.Episode;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;


/**
 * Created by RicardoFerreira on 01/07/2017.
 */
public class EpisodeDAO {
    private static Session session;
    private static SessionFactory sessionFactory;

    public EpisodeDAO(){
        sessionFactory = HibernateUtil.getSessionFactory();
        session = sessionFactory.openSession();
    }

    public static void registerEpisode(Episode episode){
        session.saveOrUpdate(episode);
        session.getTransaction().commit();
    }

    public static Episode getEpisode(int episodeid){
        Query query = session.createQuery("select e from Episode e where e.id_episode = :episodeid");
        query.setParameter("episodeid", episodeid);

        return (Episode) query.getSingleResult();
    }
}
