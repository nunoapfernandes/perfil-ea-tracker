import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { HttpModule } from '@angular/http';


import { AppComponent } from './app.component';
import { NavBarComponent } from './shared/navbar/app.navbar.component'
import { HomePageComponent } from './core/homepage/app.homepage.component'
import { TvShowInfoComponent } from './elements/tvshow-info/tv-show-info.component'
import { ProfileNavBarComponent } from './shared/profile-navbar/profile-navbar.component'
import { SeasonInfoComponent } from './elements/season-info/season-info.component'
import { EpisodeInfoComponent } from './elements/episode-info/episode-info.component'
import { MoviePageComponent } from './core/movie-page/movie-page.component'
import { MovieInfoComponent } from './elements/movie-info/movie-info.component'
import { ActionsBoxComponent } from './shared/actions-box/actions-box.component'
import { SeasonPageComponent } from './core/season-page/season-page.component'
import { InfoBoxComponent } from './shared/info-box/info-box.component'
import { SeasonGridComponent } from './elements/season-grid/season-grid.component'


import { AppRoutingModule } from './app.routing.module';
import {TvShowPage} from "./core/tvshow-page/tvshow-page.component";
import {MediaGridShowComponent} from "./elements/mediagrid-show/mediagrid-show.component";
import {CapitalizeFirstPipe} from "./pipes/capitalize-first-pipe";
import {ShowsPageComponent} from "./core/shows-page/shows-page.component";
import {MoviesPageComponent} from "./core/movies-page/movies-page.component";
import {MediaGridMovieComponent} from "./elements/mediagrid-movie/mediagrid-movie.component";



@NgModule({
  declarations: [
    AppComponent,
    NavBarComponent,
    HomePageComponent,
    TvShowInfoComponent,
    ProfileNavBarComponent,
    SeasonInfoComponent,
    EpisodeInfoComponent,
    MoviePageComponent,
    MovieInfoComponent,
    ActionsBoxComponent,
    SeasonPageComponent,
    InfoBoxComponent,
    SeasonGridComponent,
    TvShowPage,
    ShowsPageComponent,
    CapitalizeFirstPipe,
    MediaGridShowComponent,
    MoviesPageComponent,
    ShowsPageComponent,
    MediaGridMovieComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    HttpModule,
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
