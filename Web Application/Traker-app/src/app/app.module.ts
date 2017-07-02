import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';

import { AppComponent } from './app.component';
import { NavBar } from './shared/navbar/app.navbar'
import { HomePage } from './core/homepage/app.homepage'


@NgModule({
  declarations: [
    AppComponent,
    NavBar,
    HomePage
  ],
  imports: [
    BrowserModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
