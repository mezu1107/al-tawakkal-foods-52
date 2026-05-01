export interface Deal {
  id: string;
  title: string;
  description: string;
  price: number;
  oldPrice?: number;
  discountText: string;
  imageUrl: string;
  badge: "discount" | "combo";
}

export interface Category {
  id: string;
  title: string;
  imageUrl: string;
}

export interface FoodItem {
  id: string;
  title: string;
  description: string;
  price: number;
  imageUrl: string;
  rating: number;
  badge?: string;
  categoryId: string;
}

export const deals: Deal[] = [
  {
    id: "deal-1",
    title: "Buy 1 Get 1 Free Pizza",
    description: "Cheesy loaded pizza with your favorite toppings. Limited stock – grab fast!",
    price: 999,
    oldPrice: 1599,
    discountText: "40% OFF",
    imageUrl: "https://images.unsplash.com/photo-1513104890138-7c749659a591?auto=format&fit=crop&w=800&q=80",
    badge: "discount",
  },
  {
    id: "deal-2",
    title: "Burger + Fries + Drink",
    description: "Classic burger meal – choose any burger + fries + soft drink.",
    price: 649,
    discountText: "Combo Deal",
    imageUrl: "https://images.unsplash.com/photo-1568901346375-23c9450c58cd?auto=format&fit=crop&w=800&q=80",
    badge: "combo",
  },
  {
    id: "deal-3",
    title: "Family Biryani Deal",
    description: "Full family biryani with raita, salad & cold drinks for 4. Perfect weekend treat!",
    price: 1299,
    oldPrice: 1899,
    discountText: "30% OFF",
    imageUrl: "https://images.unsplash.com/photo-1606491956689-2ea866880c84?auto=format&fit=crop&w=800&q=80",
    badge: "discount",
  },
  {
    id: "deal-4",
    title: "Loaded Chicken Wings",
    description: "12 pcs crispy wings with 3 dipping sauces. Spicy, BBQ & Garlic Mayo!",
    price: 549,
    oldPrice: 799,
    discountText: "Hot Deal",
    imageUrl: "https://images.unsplash.com/photo-1567620832903-9fc6debc209f?auto=format&fit=crop&w=800&q=80",
    badge: "discount",
  },
];

export const categories: Category[] = [
  { id: "cat-1", title: "Pizza", imageUrl: "https://images.unsplash.com/photo-1513104890138-7c749659a591?auto=format&fit=crop&w=800&q=80" },
  { id: "cat-2", title: "Burgers", imageUrl: "https://images.unsplash.com/photo-1568901346375-23c9450c58cd?auto=format&fit=crop&w=800&q=80" },
  { id: "cat-3", title: "Biryani", imageUrl: "https://images.unsplash.com/photo-1606491956689-2ea866880c84?auto=format&fit=crop&w=800&q=80" },
  { id: "cat-4", title: "Karahi", imageUrl: "https://images.unsplash.com/photo-1603894584373-5ac82b2ae398?auto=format&fit=crop&w=800&q=80" },
  { id: "cat-5", title: "BBQ", imageUrl: "https://images.unsplash.com/photo-1529193591184-b1d58069ecdd?auto=format&fit=crop&w=800&q=80" },
  { id: "cat-6", title: "Desserts", imageUrl: "https://images.unsplash.com/photo-1551024601-bec78aea704b?auto=format&fit=crop&w=800&q=80" },
  { id: "cat-7", title: "Drinks", imageUrl: "https://images.unsplash.com/photo-1544145945-f90425340c7e?auto=format&fit=crop&w=800&q=80" },
  { id: "cat-8", title: "Rolls", imageUrl: "https://images.unsplash.com/photo-1626700051175-6818013e1d4f?auto=format&fit=crop&w=800&q=80" },
];

export const popularFoods: FoodItem[] = [
  {
    id: "food-1",
    title: "Chicken Biryani",
    description: "Perfectly spiced chicken biryani with raita & salad – AL Tawakkal Foods signature dish!",
    price: 550,
    imageUrl: "https://images.unsplash.com/photo-1606491956689-2ea866880c84?auto=format&fit=crop&w=800&q=80",
    rating: 4.8,
    badge: "Best Seller",
    categoryId: "cat-3",
  },
  {
    id: "food-2",
    title: "Beef Zinger Burger",
    description: "Crispy fried beef patty, cheese, fresh veggies & special sauce – unbeatable taste!",
    price: 480,
    imageUrl: "https://images.unsplash.com/photo-1568901346375-23c9450c58cd?auto=format&fit=crop&w=800&q=80",
    rating: 4.6,
    badge: "Most Ordered",
    categoryId: "cat-2",
  },
  {
    id: "food-3",
    title: "Pepperoni Pizza",
    description: "Classic pepperoni with mozzarella cheese on a crispy thin crust base.",
    price: 899,
    imageUrl: "https://images.unsplash.com/photo-1513104890138-7c749659a591?auto=format&fit=crop&w=800&q=80",
    rating: 4.7,
    badge: "Popular",
    categoryId: "cat-1",
  },
  {
    id: "food-4",
    title: "Chicken Karahi",
    description: "Traditional karahi cooked with fresh tomatoes, green chilies & aromatic spices.",
    price: 1200,
    imageUrl: "https://images.unsplash.com/photo-1603894584373-5ac82b2ae398?auto=format&fit=crop&w=800&q=80",
    rating: 4.9,
    badge: "Chef Special",
    categoryId: "cat-4",
  },
  {
    id: "food-5",
    title: "Seekh Kebab Roll",
    description: "Juicy seekh kebabs wrapped in paratha with chutney, onions & fresh salad.",
    price: 350,
    imageUrl: "https://images.unsplash.com/photo-1626700051175-6818013e1d4f?auto=format&fit=crop&w=800&q=80",
    rating: 4.5,
    categoryId: "cat-8",
  },
  {
    id: "food-6",
    title: "Chocolate Brownie",
    description: "Rich & fudgy chocolate brownie served warm with vanilla ice cream.",
    price: 250,
    imageUrl: "https://images.unsplash.com/photo-1551024601-bec78aea704b?auto=format&fit=crop&w=800&q=80",
    rating: 4.4,
    categoryId: "cat-6",
  },
];

export const quickTags = ["Biryani", "Burger", "Pizza", "Karahi", "Deals"];
