import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), zekr: "سبحان الله")
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), zekr: "سبحان الله")
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        // استرجاع البيانات من AppGroup
        let userDefaults = UserDefaults(suiteName: "group.homeScreenApp")
        let currentZekr = userDefaults?.string(forKey: "currentZekr") ?? "سبحان الله"

        let entry = SimpleEntry(date: Date(), zekr: currentZekr)
        let timeline = Timeline(entries: [entry], policy: .after(Date().addingTimeInterval(300))) // تحديث كل 5 دقائق
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let zekr: String
}

struct MyHomeWidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        VStack {
            Text(entry.zekr)
                .font(.system(size: 14))
                .multilineTextAlignment(.center)
        }
        .padding()
    }
}

struct MyHomeWidget: Widget {
    let kind: String = "MyHomeWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            if #available(iOS 17.0, *) {
                MyHomeWidgetEntryView(entry: entry)
                    .containerBackground(.fill.tertiary, for: .widget)
            } else {
                MyHomeWidgetEntryView(entry: entry)
                    .padding()
                    .background()
            }
        }
        .configurationDisplayName("أذكار")
        .description("عرض أذكار متغيرة")
    }
}

#Preview(as: .systemSmall) {
    MyHomeWidget()
} timeline: {
    SimpleEntry(date: .now, zekr: "سبحان الله")
    SimpleEntry(date: .now, zekr: "الحمد لله")
}
