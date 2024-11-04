### **Oppgave 5: Redirects og Navigation Guards**
**Mål:** Utforske hvordan man kan håndtere omdirigeringer og sette opp navigasjonsbeskyttelser.
**Beskrivelse:**  
Lag en enkel innloggingsside. Når brukere prøver å få tilgang til den detaljerte CV-siden uten å være logget inn, skal de bli omdirigert til innloggingssiden. Etter vellykket innlogging, omdiriger brukeren tilbake til den detaljerte CV-siden.

**Løsning:** 

Bruk `useNavigate` for omdirigering:

```javascript
import { Routes, Route, Outlet, useNavigate } from 'react-router-dom';

const CvPage = () => {
  let navigate = useNavigate();
  let loggedIn = // sjekk om brukeren er logget inn
  
  if (!loggedIn) {
    navigate('/login');
  }

  return <Outlet />;
}
```

**Forklaring:**  
Hvis brukeren ikke er logget inn, vil de bli omdirigert til innloggingssiden ved hjelp av `useNavigate`.

**Link:** [React Router Redirects](https://reactrouter.com/docs/en/v6/api#usehistory)

### **Oppgave 6: 404 NotFound Side**
**Mål:** Lære hvordan man håndterer ukjente ruter ved å vise en 404 side.
**Beskrivelse:**  
Legg til en 404 NotFound side i applikasjonen din. Når brukere besøker en rute som ikke finnes, skal de bli tatt til denne siden.

**Løsning:** 

```javascript
const App = () => {
  return (
    <Router>
      <Routes>
        <Route path='/' element={<HomePage />} />
        <Route path='/cv' element={<CvPage />} />
        <Route path='*' element={<NotFound />} />
      </Routes>
    </Router>
  );
}
```

**Forklaring:**  
Ved hjelp av en sti på `*`, vil hvilken som helst rute som ikke allerede er definert, matche `NotFound` komponenten.

**Link:** [Handling 404 pages with React Router](https://reactrouter.com/docs/en/v6/guides/no-match)

## Ekstra utfordringsoppgaver:
### **Oppgave 7: Bruk av useLocation**
**Mål:** Utforske hvordan man kan få tilgang til den gjeldende lokasjonens informasjon ved hjelp av `useLocation` hook.
**Beskrivelse:**  
Vis en breadcrumb-navigasjon på den detaljerte CV-siden basert på den gjeldende ruten. Bruk `useLocation` for å hente den nødvendige informasjonen om ruten.

**Løsning:** 

```javascript
import { useLocation } from 'react-router-dom';

const Breadcrumbs = () => {
  let location = useLocation();
  // Kode for å vise breadcrumbs basert på den gjeldende plasseringen.
}
```

**Forklaring:**  
Med `useLocation`, kan vi få informasjon om den gjeldende plasseringen og bygge en breadcrumb-navigasjon basert på dette.

Husk at disse løsningsforslagene er grunnleggende eksempler. Du kan utvide og tilpasse dem basert på spesifikke krav eller forbedringer du ønsker å implementere i applikasjonen din.


**Link:** [React Router useLocation](https://reactrouter.com/docs/en/v6/api#uselocation)