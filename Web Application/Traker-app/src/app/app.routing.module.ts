import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';

import { SeasonPageComponent } from './core/season-page/season-page.component';
import { MoviePageComponent } from './core/movie-page/movie-page.component';
import {HomePageComponent} from "./core/homepage/app.homepage.component";
import {ShowsPageComponent} from "./core/shows-page/shows-page.component";
import {MoviesPageComponent} from "./core/movies-page/movies-page.component";

const routes: Routes = [
  { path: 'movies', component: MoviesPageComponent },
  { path: 'shows', component: ShowsPageComponent },
  { path: 'movies/:id', component: MoviePageComponent },
  { path: 'season', component: SeasonPageComponent },
  { path: '', component: HomePageComponent },
];

@NgModule({
  imports: [ RouterModule.forRoot(routes)],
  exports: [ RouterModule ]
})

export class AppRoutingModule {}
