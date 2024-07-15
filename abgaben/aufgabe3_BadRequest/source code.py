import psycopg2
import pandas as pd
import plotly.graph_objects as go
import datetime

# Lesen von Daten

conn = psycopg2.connect(
    host="localhost",
    database="postgres",
    user="serhii",
    password="password"
)

cur = conn.cursor()

with open("../work/queries/count_queries_with_cast_members.sql", 'r') as file:
    sql_script = file.read()

cur.execute(sql_script)

records = cur.fetchall()

cur.close()
conn.close()


# Visualisierung von Daten
# Grafik für Gesamtzahl der Abfragen pro Tag nach Schauspieler erstellen
# DataFrame erstellen und die Daten vorbereiten

# DataFrame erstellen
df = pd.DataFrame(records, columns=['actor', 'queries', 'date'])

# 'date' in datetime umwandeln
df['date'] = pd.to_datetime(df['date'])

# Gruppieren von Daten nach Datum und Akteuren
grouped_df = df.groupby(['date', 'actor']).sum().reset_index()

# unique Schauspieler und Dates finden
actors = grouped_df['actor'].unique()
dates = grouped_df['date'].unique()

# Daten für eine interaktive Grafik vorbereiten
data = []
hover_text_dict = {}

# Die Daten für Grafik einlesen und die Spalten für jeden Schauspieler erstellen
# Füllen eines Wörterbuchs zum Speichern von Hover-Text nach Datum
for date in dates:
    daily_data = grouped_df[grouped_df['date'] == date]
    total_queries = daily_data['queries'].sum()
    hover_text_parts = {}
    for _, row in daily_data.iterrows():
        percent = (row['queries'] / total_queries) * 100 if total_queries != 0 else 0
        hover_text_parts[row['actor']] = f"({percent:.2f}%)"
    hover_text_dict[date] = hover_text_parts


# Spalten für jeden Schauspielern erstellen
for actor in actors:
    actor_data = grouped_df[grouped_df['actor'] == actor]
    hover_text = [hover_text_dict[date][actor]  for date in actor_data['date']]

    data.append(go.Bar(
        x=actor_data['date'],
        y=actor_data['queries'],
        name=actor,
        text=hover_text,
        # hovertextsrc="date",
        marker=dict(line=dict(width=0.5))
    ))

# Publikationsdatum von Code Da'Vinci Film zum Diagramm hinzufügen

# Hinzufügen einer vertikalen Linie für das Veröffentlichungsdatum vom Film "The Da Vinci Code"
release_date = datetime.date(2006, 5, 19)
release_line = go.Scatter(
    x=[release_date, release_date],
    y=[0, grouped_df['queries'].max()],
    mode='lines',
    name='The Da Vinci Code Release',
    line=dict(color='red', width=4, dash='dash'),
    hoverinfo='skip'  # Убираем hover для линии
)

# Die Grafik für tägliche Darstellung einstellen und zeichnen

# Einstellungen für das Diagrammlayout
layout = go.Layout(
    title='Total Queries per Day by Actor',
    xaxis=dict(title='Date'),
    yaxis=dict(title='Total Queries'),
    barmode='stack',
    hovermode='x unified',
    height=700
)

# Eine Grafik erstellen und Daten hinzufügen
fig = go.Figure(data=data, layout=layout)
fig.add_trace(release_line)

fig.show()


# Darstelleung von Durchschnittlichen Anfragen pro Woche erstellen
# Vorbereiten von Daten

df['week'] = df['date'].dt.to_period('W').apply(lambda r: r.start_time)
weekly_avg = df.groupby('week')['queries'].mean().reset_index()

# Erstellen eines zweiten Diagramms
fig2 = go.Figure()

# Die Grafik für Durchschnittliche Anfragen pro Woche einstellen und zeichnen
fig2.add_trace(go.Scatter(
    x=weekly_avg['week'],
    y=weekly_avg['queries'],
    mode='lines+markers',
    name='Average Weekly Queries',
    line=dict(color='blue', width=2)
))

# Einstellungen für das zweite Diagrammlayout
layout2 = go.Layout(
    title='Average Queries per Week',
    xaxis=dict(title='Week'),
    yaxis=dict(title='Average Queries'),
    hovermode='x unified',
    height=700
)

fig2.update_layout(layout2)

fig2.show()
