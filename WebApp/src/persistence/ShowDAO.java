package persistence;

import model.Show;
import org.hibernate.Session;
import org.hibernate.query.Query;

public class ShowDAO {

    private static Session session = HibernateUtil.getSessionFactory().openSession();

    public static void registerShow(Show show){
        session.saveOrUpdate(show);
        session.getTransaction().commit();
    }

    public static Show getShow(int showid){
        Query query = session.createQuery("select s from Show s where s.id_media = :showid");
        query.setParameter("showid", showid);

        return (Show) query.getSingleResult();
    }
}
