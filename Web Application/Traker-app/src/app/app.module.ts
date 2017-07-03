import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';

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


import { AppRoutingModule } from './app.routing.module';



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
    SeasonPageComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
