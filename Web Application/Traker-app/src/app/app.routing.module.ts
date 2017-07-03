
import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';

import { SeasonPageComponent } from './core/season-page/season-page.component';
import { MoviePageComponent } from './core/movie-page/movie-page.component';

const routes: Routes = [
  { path:'movie', component: MoviePageComponent },
  { path:'season', component: SeasonPageComponent },
];

@NgModule({
  imports: [ RouterModule.forRoot(routes)],
  exports: [ RouterModule ]
})

export class AppRoutingModule {}
