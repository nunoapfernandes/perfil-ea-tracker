import javax.persistence.*;
import java.text.DecimalFormat;
import java.util.HashSet;
import java.util.Set;

/**
 * Created by RicardoFerreira on 30/06/2017.
 */

@Entity
@Table(name="show")
public class Season {
    public Season(){}

    @Id
    @GeneratedValue
    @Column(name = "id_season")
    private int id_season;
    @Column(name = "number")
    private int number;
    @Column(name = "rating_trakt")
    private DecimalFormat rating_trakt;
    @Column(name = "tmdb")
    private String tmdb;
    @Column(name = "episodes")
    private int episodes;
    @Column(name = "aired_episodes")
    private int aired_episodes;
    @Column(name = "title")
    private String title;
    @Column(name = "overview")
    private String overview;
    @Column(name = "image_path")
    private String image_path;
    //@Column(name = "show_id")
    //private int show_id;
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "show_id", nullable = false)
    private Show show;
    @OneToMany(fetch = FetchType.LAZY, mappedBy = "season")
    private Set<Episode> episodesList = new HashSet<Episode>();
    @OneToMany(mappedBy = "primaryKey.season", cascade = CascadeType.ALL)
    private Set<UserSeason> userSeasons = new HashSet<UserSeason>();

    public int getId_season() {
        return id_season;
    }

    public void setId_season(int id_season) {
        this.id_season = id_season;
    }

    public int getNumber() {
        return number;
    }

    public void setNumber(int number) {
        this.number = number;
    }

    public DecimalFormat getRating_trakt() {
        return rating_trakt;
    }

    public void setRating_trakt(DecimalFormat rating_trakt) {
        this.rating_trakt = rating_trakt;
    }

    public String getTmdb() {
        return tmdb;
    }

    public void setTmdb(String tmdb) {
        this.tmdb = tmdb;
    }

    public int getEpisodes() {
        return episodes;
    }

    public void setEpisodes(int episodes) {
        this.episodes = episodes;
    }

    public int getAired_episodes() {
        return aired_episodes;
    }

    public void setAired_episodes(int aired_episodes) {
        this.aired_episodes = aired_episodes;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getOverview() {
        return overview;
    }

    public void setOverview(String overview) {
        this.overview = overview;
    }

    public String getImage_path() {
        return image_path;
    }

    public void setImage_path(String image_path) {
        this.image_path = image_path;
    }

    public Show getShow() {
        return show;
    }

    public void setShow(Show show) {
        this.show = show;
    }

    public Set<Episode> getEpisodesList() {
        return episodesList;
    }

    public void setEpisodesList(Set<Episode> episodesList) {
        this.episodesList = episodesList;
    }

    public Set<UserSeason> getUserSeasons() {
        return userSeasons;
    }

    public void setUserSeasons(Set<UserSeason> userSeasons) {
        this.userSeasons = userSeasons;
    }

    public void addUserSeason(UserSeason userSeason){
        this.userSeasons.add(userSeason);
    }
}
