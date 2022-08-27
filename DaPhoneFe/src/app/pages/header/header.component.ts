import { Component, OnInit } from '@angular/core';
import { NzModalService } from 'ng-zorro-antd/modal';
import { NzNotificationService } from 'ng-zorro-antd/notification';
import { catchError, concat, debounceTime, distinctUntilChanged, map, Observable, of, Subject, switchMap, tap } from 'rxjs';
import { Category } from 'src/app/entity/Category';
import { ProductParam } from 'src/app/entity/Product';
import { CategoryService } from 'src/app/services/category.service';
import { ProductService } from 'src/app/services/product.service';

@Component({
  selector: 'app-header',
  templateUrl: './header.component.html',
  styleUrls: ['./header.component.css'],
})
export class HeaderComponent implements OnInit {
  listOfCategory: Category[] = [];
  userName: string;
  productName: string;

  loadLstProducts = false;
  textInput_tenProduct$ = new Subject<string>();
  lstProducts: Observable<any[]>;

  productParam = new ProductParam();

  controlArray: Map<string, any> = new Map<string, any>();
  pageSize = 5;
  pageIndex = 1;

  constructor(
    private categoryService: CategoryService,
    private notification: NzNotificationService,
    private modal: NzModalService,
    private productService: ProductService
  ) { }

  ngOnInit(): void {
    this.getCategories();
    this.getProducts();
    const userName = localStorage.getItem('username') || '';
    if (!(userName === '')) {
      this.userName = userName;
    }
  }
  createNotification(type: string, title: string, message: string): void {
    this.notification.create(type, title, message);
  }
  getCategories() {
    this.categoryService.getAllCategory().subscribe(
      (data) => {
        if (data && data.results) {
          this.listOfCategory = data.results;
        }
      },
      (error) => {
        this.createNotification(
          'error',
          'Có lỗi xảy ra!',
          'Vui lòng liên hệ quản trị viên.'
        );
      }
    );
  }
  logout() {
    this.modal.confirm({
      nzTitle: 'Bạn có muốn đăng xuất!',
      nzContent: '',
      nzOkText: 'Có',
      nzOkType: 'primary',
      nzOkDanger: true,
      nzOnOk: () => {
        localStorage.removeItem('username');
        localStorage.removeItem('auth');
        localStorage.removeItem('userId');
        location.reload();
      },
      nzCancelText: 'No',
      nzOnCancel: () => console.log('Cancel')
    });

  }
  loadDmDvqhns() {
    
    
  }
  getProducts() {
    this.lstProducts = concat(
      this.productService.getProductSearch( new ProductParam(1, 5)).pipe(
      ), // default items
      this.textInput_tenProduct$.pipe(
        debounceTime(500),
        distinctUntilChanged(),
        tap(() => (this.loadLstProducts = true)),
        switchMap((term) =>
          this.productService
            .getProductSearch(new ProductParam(1, 5, null, null, term))
            .pipe(
              catchError(() => of([])), // empty list on error
              tap(() => (this.loadLstProducts = false))
            )
        )
      )
    );
  }

}
