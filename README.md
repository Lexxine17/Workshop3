## UsersCRUD
Aplikacja UsersCRUD to prosta aplikacja webowa umożliwiająca zarządzanie użytkownikami (dodawanie, usuwanie, edycja, podgląd). Poniżej opis dostępnych serwletów i ich adresów.

1. Lista użytkowników
   Adres: /user/list

Wyświetla listę wszystkich użytkowników w bazie.
Przy każdym użytkowniku znajdują się trzy linki:
Usuń – usuwa użytkownika
Edytuj – przechodzi do formularza edycji użytkownika
Pokaż – przechodzi do szczegółów użytkownika
Nad listą znajduje się link do formularza dodawania nowego użytkownika.
2. Dodawanie użytkownika
   Adres: /user/add

Formularz umożliwiający dodanie nowego użytkownika.
Po zatwierdzeniu formularza następuje przekierowanie na /user/list (gdzie pojawia się nowy użytkownik).
3. Edycja użytkownika
   Adres: /user/edit

Formularz umożliwiający edycję danych istniejącego użytkownika.
Po wejściu na stronę pola formularza są wypełnione aktualnymi danymi wybranego użytkownika.
Hasło należy wpisać ponownie (nie jest wyświetlane ani auto-uzupełniane).
Po zatwierdzeniu formularza następuje przekierowanie na /user/list.
4. Szczegóły użytkownika
   Adres: /user/show

Strona wyświetlająca szczegółowe informacje o wybranym użytkowniku.
Po skorzystaniu z dostępnych opcji następuje przekierowanie na /user/list.
5. Usuwanie użytkownika
   Adres: /user/delete

Usuwa wybranego użytkownika.
Po usunięciu następuje przekierowanie na /user/list.
