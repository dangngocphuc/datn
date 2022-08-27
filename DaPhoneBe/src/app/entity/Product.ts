import { Brand } from './Brand';
import { Category } from './Category';

export class Product {
  productID: number;
  productName: string;
  productImage: string;
  category: Category;
  brand: Brand;
  productRAM:string;
  productDescription: string;
  productPrice: number;
  productImportPrice: number;
  productQuantily: number;
  productDimensions: string;
  productWeight: number;
  productMaterial: string;
  quanlityBuy:number;
  productMarketprice:number;
}