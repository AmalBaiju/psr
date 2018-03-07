import { BrowserModule } from '@angular/platform-browser';
import { ErrorHandler, NgModule } from '@angular/core';
import { IonicApp, IonicErrorHandler, IonicModule } from 'ionic-angular';

import { MyApp } from './app.component';
import { HomePage } from '../pages/home/home';
import { ListPage } from '../pages/list/list';
import { AddteacherPage } from '../pages/addteacher/addteacher';
import { StatusBar } from '@ionic-native/status-bar';
import { SplashScreen } from '@ionic-native/splash-screen';
import { DatabaseProvider } from '../providers/database/database';
import { AngularFireModule } from 'angularfire2';
import { AngularFireDatabaseModule } from 'angularfire2/database';

export const firebaseConfig = {
  apiKey: "AIzaSyBb9N6XxkyAXvI8vk-AieaNdy6efXlMmSs",
  authDomain: "psrs-4d010.firebaseapp.com",
  databaseURL: "https://psrs-4d010.firebaseio.com",
  storageBucket: "psrs-4d010.appspot.com",
  messagingSenderId: "436808381535"
};

@NgModule({
  declarations: [
    MyApp,
    HomePage,
    ListPage,
      AddteacherPage
  ],
  imports: [
    BrowserModule,

    IonicModule.forRoot(MyApp),
    AngularFireModule.initializeApp(firebaseConfig),
    AngularFireDatabaseModule
  ],
  bootstrap: [IonicApp],
  entryComponents: [
    MyApp,
    HomePage,
    ListPage,
      AddteacherPage
  ],
  providers: [
    StatusBar,
    SplashScreen,
    {provide: ErrorHandler, useClass: IonicErrorHandler},
    DatabaseProvider

  ]
})
export class AppModule {}
