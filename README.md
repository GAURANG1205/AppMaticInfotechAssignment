#  Mini Shopping App – Appmatic Infotech Assignment

This is a Flutter-based **Mini Shopping App** developed as a practical assignment for **Appmatic Infotech**.

The app displays a grid of products fetched from a live API (`https://fakestoreapi.com`), allows users to view product details, add items to a cart, and view the cart with total price calculation.

---

##  Screens Implemented

-  **Home Screen** – Grid view of products
-  **Product Detail Screen** – View product description and add to cart
-  **Cart Screen** – List of cart items, remove option, and total price
-  **Cart Icon Badge** – Dynamic item count on app bar

---

##  Approach Used

- **State Management:**  
  - Used `Cubit` (via `flutter_bloc`) **only for Product Listing**
  - Used **simple global list** for Cart management (to avoid over-complication)


- **Folder Structure:**
- lib/
 - ├── Logic/ # Cubits and States
 - ├── Models/ # Product Model and Global Cart List
 - ├── Screens/ # All UI Screens
 - ├── Common/ # Common Scaffold Message

##  Packages / Libraries Used

| Package                | Purpose                                 |
|------------------------|------------------------------------------|
| `flutter_bloc`         | State management for product listing     |
| `http`                 | API integration with fakestoreapi.com    |
| `cached_network_image` | Smooth image loading and caching         |

### Add to `pubspec.yaml`:
```yaml
dependencies:
flutter_bloc: ^8.1.3
cached_network_image: ^3.3.1
http: ^0.13.5

### Challenges
-One challenge was balancing simplicity and architecture. I intentionally avoided using Cubit or Provider for the cart to keep the app lightweight, but this made UI syncing more manual (like refreshing badge count).
