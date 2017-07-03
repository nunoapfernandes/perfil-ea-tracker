package persistence;

import model.Movie;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;


public class MovieDAO {

    private static Session session = HibernateUtil.getSessionFactory().openSession();

    public static void registerMovie(Movie movie){
        session.saveOrUpdate(movie);
        session.getTransaction().commit();
    }

    public static Movie getMovie(int movieid){
        Query query = session.createQuery("select m from Movie m where m.id_media = :movieid");
        query.setParameter("movieid", movieid);
        return (Movie) query.getSingleResult();
    }

}
