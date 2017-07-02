package model;

import javax.persistence.*;
import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

/**
 * Created by RicardoFerreira on 30/06/2017.
 */

@Entity
@Table(name="season")
@PrimaryKeyJoinColumn(name="season_id", referencedColumnName = "id_media")
public class Season extends Media implements Serializable{

    //@Id
    //@GeneratedValue
    //@Column(name = "id_season")
    //private int id_season;
    @Column(name = "number")
    private int number;
    @Column(name = "episodes")
    private int episodes;

    //@Column(name = "show_id", insertable = false, updatable = false)
    //private int show_id;
    //@Column(name = "media_id", insertable = false, updatable = false)
    //private int media_id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "show_id", nullable = false)
    private Show show;

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "season")
    private Set<Episode> episodesList = new HashSet<Episode>();

    /*
    public int getMedia_id() {
        return media_id;
    }

    public void setMedia_id(int media_id) {
        this.media_id = media_id;
    }
*/
    /*
    public int getId_season() {
        return id_season;
    }

    public void setId_season(int id_season) {
        this.id_season = id_season;
    }
*/
    public int getNumber() {
        return number;
    }

    public void setNumber(int number) {
        this.number = number;
    }

    public int getEpisodes() {
        return episodes;
    }

    public void setEpisodes(int episodes) {
        this.episodes = episodes;
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

    /*
    public int getShow_id() {
        return show_id;
    }

    public void setShow_id(int show_id) {
        this.show_id = show_id;
    }
    */
}
