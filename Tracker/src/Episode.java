import javax.persistence.*;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * Created by RicardoFerreira on 30/06/2017.
 */

@Entity
@Table(name="episode")
public class Episode {
    public Episode(){}

    @Id
    @GeneratedValue
    @Column(name = "id_episode")
    private int id_episode;
    @Column(name = "number")
    private int number;
    @Column(name = "title")
    private String title;
    @Column(name = "imdb")
    private String imdb;
    @Column(name = "tmdb")
    private String tmdb;
    @Column(name = "first_aired")
    private Date first_aired;
    @Column(name = "overview")
    private String overview;
    @Column(name = "rating_trakt")
    private String rating_trakt;
    @Column(name = "image_path")
    private String image_path;
    @Column(name = "season_id")
    private int season_id;
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "season_id", nullable = false)
    private Show season;
    @OneToMany(mappedBy = "primaryKey.episode", cascade = CascadeType.ALL)
    private Set<UserEpisode> userEpisodes = new HashSet<UserEpisode>();


    public int getId_episode() {
        return id_episode;
    }

    public void setId_episode(int id_episode) {
        this.id_episode = id_episode;
    }

    public int getNumber() {
        return number;
    }

    public void setNumber(int number) {
        this.number = number;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getImdb() {
        return imdb;
    }

    public void setImdb(String imdb) {
        this.imdb = imdb;
    }

    public String getTmdb() {
        return tmdb;
    }

    public void setTmdb(String tmdb) {
        this.tmdb = tmdb;
    }

    public Date getFirst_aired() {
        return first_aired;
    }

    public void setFirst_aired(Date first_aired) {
        this.first_aired = first_aired;
    }

    public String getOverview() {
        return overview;
    }

    public void setOverview(String overview) {
        this.overview = overview;
    }

    public String getRating_trakt() {
        return rating_trakt;
    }

    public void setRating_trakt(String rating_trakt) {
        this.rating_trakt = rating_trakt;
    }

    public String getImage_path() {
        return image_path;
    }

    public void setImage_path(String image_path) {
        this.image_path = image_path;
    }

    public int getSeason_id() {
        return season_id;
    }

    public void setSeason_id(int season_id) {
        this.season_id = season_id;
    }

    public Show getSeason() {
        return season;
    }

    public void setSeason(Show season) {
        this.season = season;
    }

    public Set<UserEpisode> getUserEpisodes() {
        return userEpisodes;
    }

    public void setUserEpisodes(Set<UserEpisode> userEpisodes) {
        this.userEpisodes = userEpisodes;
    }

    public void addUserEpisode(UserEpisode userEpisode){
        this.userEpisodes.add(userEpisode);
    }
}
