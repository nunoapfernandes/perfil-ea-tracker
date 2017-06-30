import javax.persistence.*;
import java.text.DecimalFormat;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * Created by RicardoFerreira on 30/06/2017.
 */

@Entity
@Table(name="show")
public class Show {
    public Show(){}

    @Id
    @GeneratedValue
    @Column(name = "id_show")
    private int id_show;
    @Column(name = "title")
    private String title;
    @Column(name = "slug")
    private String slug;
    @Column(name = "imdb")
    private String imdb;
    @Column(name = "tmdb")
    private String tmdb;
    @Column(name = "overview")
    private String overview;
    @Column(name = "first_aired")
    private Date first_aired;
    @Column(name = "aired_day")
    private String aired_day;
    @Column(name = "aired_time")
    private String aired_time;
    @Column(name = "aired_timezone")
    private String aired_timezone;
    @Column(name = "runtime")
    private int runtime;
    @Column(name = "certification")
    private String certification;
    @Column(name = "network")
    private String network;
    @Column(name = "country")
    private String country;
    @Column(name = "trailer")
    private String trailer;
    @Column(name = "homepage")
    private String homepage;
    @Column(name = "status")
    private String status;
    @Column(name = "rating_trakt")
    private DecimalFormat rating_trankt;
    @Column(name = "language")
    private String language;
    @Column(name = "aired_episodes")
    private int aired_episodes;
    @Column(name = "image_path")
    private String image_path;
    @Column(name = "seasons")
    private int seasons;
    @OneToMany(fetch = FetchType.LAZY, mappedBy = "show")
    private Set<Season> seasonsList = new HashSet<Season>();
    @ManyToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    @JoinTable(
            name = "show_has_genre",
            joinColumns = @JoinColumn(name = "show_id"),
            inverseJoinColumns = @JoinColumn(name = "genre_id")
    )
    private Set<Genre> showGenreList = new HashSet<Genre>();
    @OneToMany(mappedBy = "primaryKey.movie", cascade = CascadeType.ALL)
    private Set<UserShow> userShows = new HashSet<UserShow>();


    public int getId_show() {
        return id_show;
    }

    public void setId_show(int id_show) {
        this.id_show = id_show;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getSlug() {
        return slug;
    }

    public void setSlug(String slug) {
        this.slug = slug;
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

    public String getOverview() {
        return overview;
    }

    public void setOverview(String overview) {
        this.overview = overview;
    }

    public Date getFirst_aired() {
        return first_aired;
    }

    public void setFirst_aired(Date first_aired) {
        this.first_aired = first_aired;
    }

    public String getAired_day() {
        return aired_day;
    }

    public void setAired_day(String aired_day) {
        this.aired_day = aired_day;
    }

    public String getAired_time() {
        return aired_time;
    }

    public void setAired_time(String aired_time) {
        this.aired_time = aired_time;
    }

    public String getAired_timezone() {
        return aired_timezone;
    }

    public void setAired_timezone(String aired_timezone) {
        this.aired_timezone = aired_timezone;
    }

    public int getRuntime() {
        return runtime;
    }

    public void setRuntime(int runtime) {
        this.runtime = runtime;
    }

    public String getCertification() {
        return certification;
    }

    public void setCertification(String certification) {
        this.certification = certification;
    }

    public String getNetwork() {
        return network;
    }

    public void setNetwork(String network) {
        this.network = network;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getTrailer() {
        return trailer;
    }

    public void setTrailer(String trailer) {
        this.trailer = trailer;
    }

    public String getHomepage() {
        return homepage;
    }

    public void setHomepage(String homepage) {
        this.homepage = homepage;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public DecimalFormat getRating_trankt() {
        return rating_trankt;
    }

    public void setRating_trankt(DecimalFormat rating_trankt) {
        this.rating_trankt = rating_trankt;
    }

    public String getLanguage() {
        return language;
    }

    public void setLanguage(String language) {
        this.language = language;
    }

    public int getAired_episodes() {
        return aired_episodes;
    }

    public void setAired_episodes(int aired_episodes) {
        this.aired_episodes = aired_episodes;
    }

    public String getImage_path() {
        return image_path;
    }

    public void setImage_path(String image_path) {
        this.image_path = image_path;
    }

    public int getSeasons() {
        return seasons;
    }

    public void setSeasons(int seasons) {
        this.seasons = seasons;
    }

    public Set<Season> getSeasonsList() {
        return seasonsList;
    }

    public void setSeasonsList(Set<Season> seasonsList) {
        this.seasonsList = seasonsList;
    }

    public Set<Genre> getShowGenreList() {
        return showGenreList;
    }

    public void setShowGenreList(Set<Genre> showGenreList) {
        this.showGenreList = showGenreList;
    }

    public Set<UserShow> getUserShows() {
        return userShows;
    }

    public void setUserShows(Set<UserShow> userShows) {
        this.userShows = userShows;
    }

    public void addUserShow(UserShow userShow){
        this.userShows.add(userShow);
    }
}
