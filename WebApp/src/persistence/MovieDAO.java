package persistence;

import model.Movie;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;


public class MovieDAO {

    private static Session session;
    private static SessionFactory sessionFactory;

    public MovieDAO(){
        sessionFactory = HibernateUtil.getSessionFactory();
        session = sessionFactory.openSession();
    }

    public static void registerMovie(Movie movie){
        session.saveOrUpdate(movie);
        session.getTransaction().commit();
    }

    public static Movie getMovie(int movieid){
        SessionFactory factory = HibernateUtil.getSessionFactory();
        Session session = factory.openSession();
        Query query = session.createQuery("select m from Movie m where m.id_movie = :movieid");
        query.setParameter("movieid", movieid);

        return (Movie) query.getSingleResult();
    }

}
