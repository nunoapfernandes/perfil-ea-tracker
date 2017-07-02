package persistence;

import model.Media;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import java.util.List;

/**
 * Created by RicardoFerreira on 01/07/2017.
 */
public class MediaDAO {

    private static Session session;
    private static SessionFactory sessionFactory;

    public MediaDAO(){
        sessionFactory = HibernateUtil.getSessionFactory();
        session = sessionFactory.openSession();
    }

    public static List<Media> searchMedia(String name){
        List<Media> allMedia;

        Query query = session.createQuery("select m from Media m where m.title='"+name+"'");
        allMedia = query.getResultList();
        return allMedia;
    }

    public static List<Media> listUserWatchedMedia(int userid){
        List<Media> allMedia;

        Query query = session.createQuery("select m from Media m join UserMedia um where um.user_id = : userid and um.watched = true");
        query.setParameter("userid", userid);
        allMedia = query.getResultList();

        return allMedia;
    }

    public static List<Media> listUserWatchListMedia(int userid){
        List<Media> allMedia;

        Query query = session.createQuery("select m from Media m join UserMedia um where um.user_id = : userid and um.watchlist = true");
        query.setParameter("userid", userid);
        allMedia = query.getResultList();

        return allMedia;
    }

    public static List<Media> listAllMedia(){
        List allMedia;
        Query query = session.createQuery("from Media");
        allMedia = query.getResultList();

        return allMedia;
    }

    public static List<Media> listAllByCategory(int category){
        List allMedia;
        Query query = session.createQuery("from Media where category="+category);
        allMedia = query.getResultList();

        return allMedia;
    }

    public static List<Media> listAllWatchedByCategory(int category, int userid){
        List allMedia;
        Query query = session.createQuery("select m from Media m join UserMedia um where um.user_id = :userid and m.category = :category and um.watched = true");
        query.setParameter("userid", userid);
        query.setParameter("category", category);
        allMedia = query.getResultList();

        return allMedia;
    }

    public static List<Media> listAllWatchListByCategory(int category, int userid){
        List allMedia;
        Query query = session.createQuery("select m from Media m join UserMedia um where um.user_id = :userid and m.category = :category and um.watchlist = true");
        query.setParameter("userid", userid);
        query.setParameter("category", category);
        allMedia = query.getResultList();

        return allMedia;
    }

    public static List<Media> listShowSeasons(int showid){
        List<Media> allMedia;
        Query query = session.createQuery("from Media m join Season s where s.show_id = :showid");
        query.setParameter("showid", showid);
        allMedia = query.getResultList();

        return allMedia;
    }

    public static List<Media> listSeasonEpisodes(int seasonid){
        List<Media> allMedia;
        Query query = session.createQuery("from Media m join Episode e where e.season_id = :seasonid");
        query.setParameter("seasonid", seasonid);
        allMedia = query.getResultList();

        return allMedia;
    }








    /*
    public List<Media> listUserWatchedMediaByDateAscending(User user){
        List<Media> allMedia;

        Query query = session.createQuery("select m from Media m join UserMedia um on um.user_id = : userid and um.watched = true order by m.released asc");
        query.setParameter("userid", user.getId_user());
        allMedia = query.getResultList();

        return allMedia;
    }

    public List<Media> listUserWatchedMediaByDateDescending(User user){

        List<Media> allMedia;

        Query query = session.createQuery("select m from Media m join UserMedia um on um.user_id = : userid and um.watched = true order by m.released desc");
        query.setParameter("userid", user.getId_user());
        allMedia = query.getResultList();

        return allMedia;
    }

    public List<Media> listUserWatchedMediaByRateAscending(User user){
        List<Media> allMedia;

        Query query = session.createQuery("select m from Media m join UserMedia um on um.user_id = : userid and um.watched = true order by m.rating asc");
        query.setParameter("userid", user.getId_user());
        allMedia = query.getResultList();

        return allMedia;
    }

    public List<Media> listUserWatchedMediaByRateDescending(User user){

        List<Media> allMedia;

        Query query = session.createQuery("select m from Media m join UserMedia um on um.user_id = : userid and um.watched = true order by m.rating desc");
        query.setParameter("userid", user.getId_user());
        allMedia = query.getResultList();

        return allMedia;
    }

    public List<Media> listUserWatchListMediaByDateAscending(User user){
        List<Media> allMedia;

        Query query = session.createQuery("select m from Media m join UserMedia um on um.user_id = : userid and um.watchlist = true order by m.released asc");
        query.setParameter("userid", user.getId_user());
        allMedia = query.getResultList();

        return allMedia;
    }

    public List<Media> listUserWatchListMediaByDateDescending(User user){
        List<Media> allMedia;

        Query query = session.createQuery("select m from Media m join UserMedia um on um.user_id = : userid and um.watchlist = true order by m.released desc");
        query.setParameter("userid", user.getId_user());
        allMedia = query.getResultList();

        return allMedia;
    }

    public List<Media> listUserWatchListMediaByRateDescending(User user){
        List<Media> allMedia;

        Query query = session.createQuery("select m from Media m join UserMedia um on um.user_id = : userid and um.watchlist = true order by m.rating desc");
        query.setParameter("userid", user.getId_user());
        allMedia = query.getResultList();

        return allMedia;
    }

    public List<Media> listUserWatchListMediaByRateAscending(User user){
        List<Media> allMedia;

        Query query = session.createQuery("select m from Media m join UserMedia um on um.user_id = : userid and um.watchlist = true order by m.rating asc");
        query.setParameter("userid", user.getId_user());
        allMedia = query.getResultList();

        return allMedia;
    }
*/





    /*

    public List<Media> listAllMovies(){
        List<Media> movies;
        Query query = session.createQuery("select m from Media m where m.category = :category", Media.class);
        query.setParameter("category", 1);
        movies = query.getResultList();

        return movies;
    }

    public List<Media> listAllShows(){
        List<Media> shows;
        Query query = session.createQuery("select m from Media m where m.category = :category", Media.class);
        query.setParameter("category", 2);
        shows = query.getResultList();

        return shows;
    }

    public List<Media> listAllSeasons(){
        List<Media> seasons;
        Query query = session.createQuery("select m from Media m where m.category = :category", Media.class);
        query.setParameter("category", 3);
        seasons = query.getResultList();

        return seasons;
    }

    public List<Media> listAllEpisodes(){
        List<Media> shows;
        Query query = session.createQuery("select m from Media m where m.category = :category", Media.class);
        query.setParameter("category", 4);
        shows = query.getResultList();

        return shows;
    }

    public List<Media> listMediaByRatingBest(){
        List<Media> allMedia;
        Query query = session.createQuery("from Media order by rating desc ");
        allMedia = query.getResultList();

        return allMedia;
    }

    public List<Media> listMediaByRatingWorst(){
        List<Media> allMedia;
        Query query = session.createQuery("from Media order by rating asc ");
        allMedia = query.getResultList();

        return allMedia;
    }

    public List<Media> listMediaMoviesByRatingBest(){
        List<Media> allMedia;
        Query query = session.createQuery("from Media where category = 1 order by rating desc ");
        allMedia = query.getResultList();

        return allMedia;
    }

    public List<Media> listMediaMoviesByRatingWorst(){
        List<Media> allMedia;
        Query query = session.createQuery("from Media where category = 1 order by rating asc ");
        allMedia = query.getResultList();

        return allMedia;
    }

    public List<Media> listMediaShowsByRatingBest(){
        List<Media> allMedia;
        Query query = session.createQuery("from Media where category = 2 order by rating desc ");
        allMedia = query.getResultList();

        return allMedia;
    }

    public List<Media> listMediaShowsByRatingWorst(){
        List<Media> allMedia;
        Query query = session.createQuery("from Media where category = 2 order by rating asc ");
        allMedia = query.getResultList();

        return allMedia;
    }

    public List<Media> listMediaSeasonsByRatingBest(){
        List<Media> allMedia;
        Query query = session.createQuery("from Media where category = 3 order by rating desc ");
        allMedia = query.getResultList();

        return allMedia;
    }

    public List<Media> listMediaSeasonsByRatingWorst(){
        List<Media> allMedia;
        Query query = session.createQuery("from Media where category = 3 order by rating asc ");
        allMedia = query.getResultList();

        return allMedia;
    }

    public List<Media> listMediaEpisodesByRatingBest(){
        List<Media> allMedia;
        Query query = session.createQuery("from Media where category = 4 order by rating desc ");
        allMedia = query.getResultList();

        return allMedia;
    }

    public List<Media> listMediaEpisodesByRatingWorst(){
        List<Media> allMedia;
        Query query = session.createQuery("from Media where category = 4 order by rating asc ");
        allMedia = query.getResultList();

        return allMedia;
    }

    public List<Media> listMediaByReleaseDateAsc(){
        List<Media> allMedia;
        Query query = session.createQuery("from Media order by released asc ");
        allMedia = query.getResultList();

        return allMedia;
    }

    public List<Media> listMediaByReleaseDateDesc(){
        List<Media> allMedia;
        Query query = session.createQuery("from Media order by released desc ");
        allMedia = query.getResultList();

        return allMedia;
    }

    public List<Media> listMediaMoviesByReleaseDateAsc(){
        List<Media> allMedia;
        Query query = session.createQuery("from Media where category = 1 order by released asc ");
        allMedia = query.getResultList();

        return allMedia;
    }

    public List<Media> listMediaMoviesByReleaseDateDesc(){
        List<Media> allMedia;
        Query query = session.createQuery("from Media where category = 1 order by released desc ");
        allMedia = query.getResultList();

        return allMedia;
    }

    public List<Media> listMediaShowsByReleaseDateAsc(){
        List<Media> allMedia;
        Query query = session.createQuery("from Media where category = 2 order by released asc ");
        allMedia = query.getResultList();

        return allMedia;
    }

    public List<Media> listMediaShowsByReleaseDateDesc(){
        List<Media> allMedia;
        Query query = session.createQuery("from Media where category = 2 order by released desc ");
        allMedia = query.getResultList();

        return allMedia;
    }

    public List<Media> listMediaSeasonsByReleaseDateAsc(){
        List<Media> allMedia;
        Query query = session.createQuery("from Media where category = 3 order by released asc ");
        allMedia = query.getResultList();

        return allMedia;
    }

    public List<Media> listMediaSeasonsByReleaseDateDesc(){
        List<Media> allMedia;
        Query query = session.createQuery("from Media where category = 3 order by released desc ");
        allMedia = query.getResultList();

        return allMedia;
    }

    public List<Media> listMediaEpisodesByReleaseDateAsc(){
        List<Media> allMedia;
        Query query = session.createQuery("from Media where category = 4 order by released asc ");
        allMedia = query.getResultList();

        return allMedia;
    }

    public List<Media> listMediaEpisodesByReleaseDateDesc(){
        List<Media> allMedia;
        Query query = session.createQuery("from Media where category = 4 order by released desc ");
        allMedia = query.getResultList();

        return allMedia;
    }

    */

}
