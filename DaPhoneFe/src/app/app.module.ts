import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { NZ_I18N } from 'ng-zorro-antd/i18n';
import { en_US } from 'ng-zorro-antd/i18n';
import { registerLocaleData } from '@angular/common';
import en from '@angular/common/locales/en';
import { FormsModule } from '@angular/forms';
import { HttpClientModule, HTTP_INTERCEPTORS } from '@angular/common/http';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { SharedModule } from './shared/shared.module';
import { HomeComponent } from './pages/home/home.component';
import { ProductComponent } from './pages/product/product.component';
import { LoginComponent } from './pages/login/login.component';
import { CartComponent } from './pages/cart/cart.component';
import { HeaderComponent } from './pages/header/header.component';
import { FooterComponent } from './pages/footer/footer.component';
import { ContactComponent } from './pages/contact/contact.component';
import { ProductDetailComponent } from './pages/product-detail/product-detail.component';
import { SignupComponent } from './pages/signup/signup.component';
import { PaymentComponent } from './pages/payment/payment.component';
import { PaySuccessComponent } from './pages/pay-success/pay-success.component';
import { OrderComponent } from './pages/order/order.component';
import { NotFoundComponent } from './pages/not-found/not-found.component';
import { NgSelectModule } from '@ng-select/ng-select';
import { LoaderService } from './services/loader/loader.service';
import { LoaderComponent } from './pages/loader/loader.component';
import { LoaderInterceptor } from './interceptor/loader.interceptor';
registerLocaleData(en);

@NgModule({
  declarations: [
    AppComponent,
    HomeComponent,
    LoaderComponent,
    ProductComponent,
    LoginComponent,
    CartComponent,
    HeaderComponent,
    FooterComponent,
    ContactComponent,
    ProductDetailComponent,
    SignupComponent,
    PaymentComponent,
    PaySuccessComponent,
    OrderComponent,
    NotFoundComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    FormsModule,
    NgSelectModule,
    HttpClientModule,
    BrowserAnimationsModule,
    SharedModule
  ],
  providers: [LoaderService,{ provide: NZ_I18N, useValue: en_US },{ provide: HTTP_INTERCEPTORS, useClass: LoaderInterceptor, multi: true }],
  bootstrap: [AppComponent]
})
export class AppModule { }
