### **Oppgave 5: Bruk av Type Assertions**

**Mål:** Forstå hvordan og når du skal bruke type assertions i TypeScript.

**Beskrivelse:**  
I CV-applikasjonen, opprett en hjelpefunksjon `parseUserData` som tar en streng (JSON format) og konverterer den til et objekt. Bruk type assertions for å forsikre TypeScript at den returnerte verdien er av en spesifikk type (f.eks. `UserProfile` type).

**Link:** [TypeScript Type Assertions](https://www.typescriptlang.org/docs/handbook/basic-types.html#type-assertions)

**Trinnvis Løsning:**

1. **Opprett en ny fil:**  
   Lag en ny fil kalt `UserProfile.ts`.

2. **Definer et grensesnitt for brukerprofildata:**  

   ```typescript
   interface UserProfile {
     name: string;
     age: number;
     experience: { title: string; years: number }[];
   }
   ```

3. **Opprett funksjonen `parseUserData`:**  

   ```typescript
   const parseUserData = (jsonData: string): UserProfile => JSON.parse(jsonData) as UserProfile;
   ```

**Forklaring:**

Funksjonen `parseUserData` konverterer en JSON-streng til et objekt. Ved bruk av type assertions (i dette tilfellet `as UserProfile`), forsikrer vi TypeScript om at det returnerte objektet matcher grensesnittet `UserProfile`.

Dette er nyttig når vi vet hvilken form dataen vil ha, selv om TypeScript ikke automatisk kan dedusere det. Type assertions tillater oss å spesifikt 'fortelle' TypeScript hvilken type en verdi er, forutsatt at vi vet mer enn TypeScript om den aktuelle verdien.

Merk: Mens type assertions kan være kraftige, bør de brukes varsomt. Å forsikre TypeScript feilaktig om en types form kan føre til uventede feil som er vanskelige å feilsøke.

[TypeScript Type Assertions](https://www.typescriptlang.org/docs/handbook/basic-types.html#type-assertions)  
[Assert function argument is a certain type in TypeScript](https://stackoverflow.com/questions/40081332/assert-function-argument-is-a-certain-type-in-typescript)


### **Oppgave 6: Union Typer og Literal Typer**

**Mål:** Utforske hvordan union typer og literal typer kan være nyttige i CV-applikasjonen.

**Beskrivelse:**  
Lag en komponent `Filter` i CV-applikasjonen som lar brukere filtrere jobberfaring basert på jobbtittel eller årstall. Denne komponenten skal ha en prop som bestemmer hvilken type filter den skal bruke. Bruk union typer for å definere denne propen som enten en streng (jobbtittel) eller et nummer (årstall). Bruk også literal typer for å sikre at den aksepterte strengen er en av forhåndsdefinerte jobbtitler.

**Link:** [TypeScript Union and Literal Types](https://www.typescriptlang.org/docs/handbook/unions-and-intersections.html)

**Trinnvis Løsning:**

1. **Opprett en ny fil:**  
   Lag en ny fil kalt `Filter.tsx`.

2. **Definer typer for filtrering:**  

   ```typescript
   type JobTitle = 'Developer' | 'Designer' | 'Manager';
   type FilterType = string | number;
   ```

3. **Opprett Filter-komponenten:**  

   ```typescript
   interface FilterProps {
     filterBy: FilterType;
   }

   const Filter: React.FC<FilterProps> = ({ filterBy }) => {
     if (typeof filterBy === 'string') {
       // Filtrer etter jobbtittel
       return <div>Filtering by job title: {filterBy}</div>;
     } else if (typeof filterBy === 'number') {
       // Filtrer etter årstall
       return <div>Filtering by year: {filterBy}</div>;
     } else {
       return null;
     }
   };
   ```

**Forklaring:**

Vi starter med å definere `JobTitle` som en literal type. Dette betyr at den kan være en av tre strenger: 'Developer', 'Designer', eller 'Manager'. Vi definerer deretter `FilterType` som en union type, noe som betyr at den kan være enten en `string` eller et `number`.

I `Filter`-komponenten bruker vi type-sjekker (`typeof filterBy === 'string'`) for å avgjøre hvordan vi skal filtrere, basert på om `filterBy` er en streng eller et nummer. Denne tilnærmingen utnytter kraften av TypeScript for å sørge for at koden vår er type-sikker og gir forventet oppførsel basert på hvilken type data som sendes til komponenten.

Union og literal typer i TypeScript gir fleksibilitet i definisjonen av variable typer, samtidig som de gir sterk typesikkerhet.

[TypeScript Union and Literal Types](https://www.typescriptlang.org/docs/handbook/unions-and-intersections.html)  
[Practical TypeScript: Union and Intersection Types](https://dzone.com/articles/practical-typescript-union-and-intersection-types)


## Ekstra utfordringsoppgaver:

### **Oppgave 7: Generiske Typer**

**Mål:** Utforske dypere bruken av generiske typer i TypeScript.

**Beskrivelse:**  
Lag en generisk funksjon `getDetails` som tar en array av objekter og en nøkkel som en streng. Denne funksjonen skal returnere en ny array med verdiene tilhørende den nøkkelen fra hvert objekt. For eksempel, hvis den mottar en array av jobberfaringer og nøkkelen 'jobTitle', skal den returnere en array av jobbtitlene.

**Link:** [TypeScript Handbook: Generics](https://www.typescriptlang.org/docs/handbook/generics.html)

**Trinnvis Løsning:**

1. **Opprett en ny fil:**  
   Lag en ny fil kalt `Utilities.ts`.

2. **Definer en generisk funksjon:**  

   ```typescript
   const getDetails = <T, K extends keyof T>(items: T[], key: K): T[K][] => items.map(item => item[key]);
   ```

3. **Eksempel på bruk:**  

   ```typescript
   const jobExperiences = [
     { jobTitle: 'Developer', year: 2020 },
     { jobTitle: 'Designer', year: 2019 },
   ];

   const jobTitles = getDetails(jobExperiences, 'jobTitle'); // ['Developer', 'Designer']
   ```

**Forklaring:**

I denne oppgaven har vi laget en generisk funksjon ved navn `getDetails` som returnerer detaljer fra en gitt nøkkel for hvert objekt i en array. 

Den første generiske typen, `T`, representerer en hvilken som helst type. Den andre generiske typen, `K`, er begrenset til å være en nøkkel av `T` ved hjelp av `extends keyof T`.

Ved å kalle `getDetails` med `jobExperiences`-arrayen og nøkkelen 'jobTitle', får vi en ny array som inneholder kun jobbtitlene fra `jobExperiences`.

Generiske typer tillater deg å lage fleksible funksjoner og komponenter som kan håndtere mange forskjellige datatyper samtidig som de gir type-sikkerhet.

[TypeScript Handbook: Generics](https://www.typescriptlang.org/docs/handbook/generics.html)  
[Understanding TypeScript Generics](https://www.tutorialsteacher.com/typescript/typescript-generics)