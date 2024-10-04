
# Oppgavesett: Interaktiv Online CV Webapplikasjon

##  Innføring i introduksjon til `React`

### Oppgave 1: Installasjon

1. Installer Node.js på datamaskinen din hvis du ikke allerede har gjort det.

2. Bekreft at Node.js og npm (Node Package Manager) er korrekt installert ved å kjøre `node -v` og `npm -v` i terminalen eller kommandolinjen.
  
### Oppgave 2: Opprett et nytt React-prosjekt

1. Opprett et nytt React-prosjekt ved å kjøre `npx create-react-app online-cv`.

2. Naviger til prosjektets mappe ved å kjøre `cd online-cv`.

3. Start prosjektet ved å kjøre `npm start` og bekreft at det kjører korrekt i nettleseren.

  

### Oppgave 3: Grunnleggende Struktur

1. Fjern all standardkode i `App.js`.

2. Legg til en overskrift som sier 'Mitt Online CV'.

3. Under overskriften, legg til et bilde av deg selv eller et plassholderbilde.

4. Legg til grunnleggende informasjon som navn, adresse, telefonnummer og e-post. (Vent med å legge inn ekte informasjon til dere er klare til å deplye web applikasjonen deres)

  

### Oppgave 4: Interaktivitet

1. Legg til en knapp under din informasjon med teksten 'Vis detaljer'.

2. Når knappen klikkes, skal det poppe opp en `alert`-boks med en liste over dine ferdigheter/tjenester.

### Utfordringsoppgave 1: Komponenter

1. Splitt din CV applikasjon inn i mindre komponenter. Opprett minst tre separate komponenter: `Header`, `PersonalInfo` og `SkillsButton`.

2.  `Header` skal inneholde tittelen 'Mitt Online CV' og bildet ditt.

3.  `PersonalInfo` skal vise din personlige informasjon: navn, adresse, telefonnummer, og e-post.

4.  `SkillsButton` skal være knappen som sier 'Vis detaljer' og som viser alert-boksen fra tidligere.

  

### Utfordringsoppgave 2: Props

1. Overfør relevant data til komponentene ved hjelp av props.

2. For eksempel, overfør personlige detaljer til `PersonalInfo` komponenten som props.

---

## Innføring i `Components` & `Props` i React

1. **Komponenter og Props:** Opprett en ny komponent `Education` i en separat fil `Education.js`. Denne komponenten skal ta inn to props: `school` og `degree`, og den skal returnere en `div` med skolens navn og graden.

2. **Hendelser og Håndtering:** Legg til en ny komponent `Skills` i en separat fil `Skills.js`. Denne komponenten skal ta inn en prop `skills` som er en array med ferdigheter. Komponenten skal vise en knapp som sier 'Vis ferdigheter'. Når denne knappen trykkes, skal en alert boks vise alle ferdighetene i arrayet.

3. **Komponent Sammensetning:** Opprett en `Footer` komponent i en egen fil `Footer.js`. Denne komponenten skal ta inn en prop `year`, og skal returnere en `div` som sier '© [year] Ditt Navn'. 

4. **Props og Hendelser:** Modifiser `Skills` komponenten for å ta inn en ekstra prop `onSkillClick`. Dette skal være en funksjon som blir kalt når en enkelt ferdighet i listen blir klikket. Funksjonen skal vise en alert med teksten '[skill] er klikket!'.


### Ekstra utfordringsoppgaver:

1. Opprett en `Projects` komponent i en egen fil `Projects.js`. Denne komponenten skal ta inn en prop `projects` som er en array av prosjektobjekter. Hvert prosjektobjekt skal ha `title`, `description`, og `link`. Komponenten skal vise en liste over alle prosjektene med en link til prosjektet. Når linken klikkes, skal siden åpnes i en ny fane.

2. Endre `Skills` komponenten slik at den viser en liste over ferdigheter med en 'Slett' knapp ved siden av hver ferdighet. Når 'Slett' knappen klikkes, skal den tilhørende ferdigheten fjernes fra listen.

---





## Innføring i React `Hooks: useState`

### **Oppgave 1:** Vis CV-informasjon

Lag en seksjon i din CV-webapplikasjon hvor brukeren kan fylle inn sin grunnleggende informasjon: `Navn`, `Alder`, og `Yrke`. Bruk `useState` for å lagre og vise denne informasjonen.

  

### **Oppgave 2:** Interaktiv Ferdighetsliste

Lag en funksjon som lar brukeren legge til en liste over ferdigheter. Brukeren skal kunne skrive en ny ferdighet i et tekstfelt og legge den til i en liste ved å trykke en knapp. Bruk `useState` for å håndtere denne listen.

  

### **Oppgave 3:** Custom Hook for CV Data

Lag en egendefinert hook kalt `useCVData` som lar deg lagre og hente CV-data. Denne hooken bør ha funksjoner for å legge til ferdigheter og oppdatere grunnleggende informasjon.


## **Ekstra utfordringsoppgaver:**

### **Oppgave 4:** Språk Velger
Lag en funksjon som lar brukeren velge mellom forskjellige språk for CV-en. Når et språk er valgt, skal all tekst i CVen oppdateres til det valgte språket. Hint: Du kan ha forskjellige tekststrenger lagret i en tilstand basert på valgt språk.

---
