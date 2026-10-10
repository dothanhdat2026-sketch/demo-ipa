import SwiftUI
import UIKit

@main
struct ThanhDatDeveloperApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .preferredColorScheme(.dark)
        }
    }
}

struct ContentView: View {
    @State private var selectedTab = 0
    @State private var showingContact = false

    private let background = Color(red: 0.035, green: 0.045, blue: 0.075)
    private let cyan = Color(red: 0.25, green: 0.92, blue: 0.95)
    private let violet = Color(red: 0.62, green: 0.40, blue: 1.0)

    var body: some View {
        ZStack {
            background.ignoresSafeArea()

            // Subtle developer-style glow in the background.
            GeometryReader { proxy in
                Circle()
                    .fill(cyan.opacity(0.12))
                    .frame(width: 250, height: 250)
                    .blur(radius: 90)
                    .position(x: proxy.size.width * 0.95, y: 100)

                Circle()
                    .fill(violet.opacity(0.12))
                    .frame(width: 240, height: 240)
                    .blur(radius: 90)
                    .position(x: 10, y: proxy.size.height * 0.68)
            }
            .ignoresSafeArea()

            VStack(spacing: 0) {
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 22) {
                        header

                        if selectedTab == 0 {
                            overviewContent
                        } else if selectedTab == 1 {
                            projectsContent
                        } else {
                            contactContent
                        }

                        footer
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 14)
                    .padding(.bottom, 24)
                }

                bottomNavigation
            }
        }
        .alert("Kết nối với Thành Đạt", isPresented: $showingContact) {
            Button("Đã hiểu", role: .cancel) { }
        } message: {
            Text("Hãy cập nhật email, GitHub hoặc đường dẫn mạng xã hội của bạn trong file ContentView.swift.")
        }
    }

    private var header: some View {
        HStack(alignment: .center) {
            HStack(spacing: 9) {
                ZStack {
                    RoundedRectangle(cornerRadius: 12)
                        .fill(
                            LinearGradient(
                                colors: [cyan, violet],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .frame(width: 42, height: 42)

                    Image(systemName: "chevron.left.forwardslash.chevron.right")
                        .font(.system(size: 16, weight: .black, design: .monospaced))
                        .foregroundStyle(background)
                }

                VStack(alignment: .leading, spacing: 2) {
                    Text("THANH DAT")
                        .font(.system(size: 14, weight: .black, design: .monospaced))
                        .tracking(1.5)
                        .foregroundStyle(.white)

                    Text("DEVELOPER PORTFOLIO")
                        .font(.system(size: 9, weight: .medium, design: .monospaced))
                        .tracking(1.1)
                        .foregroundStyle(.white.opacity(0.48))
                }
            }

            Spacer()

            HStack(spacing: 6) {
                Circle()
                    .fill(Color.green)
                    .frame(width: 6, height: 6)
                Text("ONLINE")
                    .font(.system(size: 10, weight: .bold, design: .monospaced))
                    .tracking(0.7)
                    .foregroundStyle(Color.green)
            }
            .padding(.horizontal, 10)
            .padding(.vertical, 8)
            .background(Color.green.opacity(0.09))
            .overlay(Capsule().stroke(Color.green.opacity(0.25), lineWidth: 1))
            .clipShape(Capsule())
        }
    }

    private var overviewContent: some View {
        VStack(alignment: .leading, spacing: 22) {
            VStack(alignment: .leading, spacing: 14) {
                Text("HELLO, WORLD!")
                    .font(.system(size: 11, weight: .bold, design: .monospaced))
                    .tracking(2.5)
                    .foregroundStyle(cyan)

                (
                    Text("Xin chào,\n")
                        .foregroundColor(.white.opacity(0.92))
                    + Text("mình là ")
                        .foregroundColor(.white.opacity(0.92))
                    + Text("Thành Đạt.")
                        .foregroundColor(cyan)
                )
                .font(.system(size: 34, weight: .bold, design: .rounded))
                .lineSpacing(3)
                .fixedSize(horizontal: false, vertical: true)

                Text("Yêu công nghệ, thích xây dựng sản phẩm số và biến ý tưởng thành trải nghiệm hữu ích.")
                    .font(.system(size: 15))
                    .lineSpacing(5)
                    .foregroundStyle(.white.opacity(0.65))
                    .fixedSize(horizontal: false, vertical: true)

                HStack(spacing: 10) {
                    Label("Swift", systemImage: "swift")
                    Label("iOS", systemImage: "iphone")
                    Label("UI/UX", systemImage: "square.grid.2x2")
                }
                .font(.system(size: 11, weight: .semibold, design: .monospaced))
                .foregroundStyle(.white.opacity(0.85))
                .padding(.top, 2)
            }
            .padding(.top, 10)

            profileCard
            codeCard
            skillsSection
        }
    }

    private var profileCard: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Text("01 / PROFILE")
                    .font(.system(size: 10, weight: .bold, design: .monospaced))
                    .tracking(1.5)
                    .foregroundStyle(cyan)

                Spacer()

                Image(systemName: "ellipsis")
                    .foregroundStyle(.white.opacity(0.45))
            }

            HStack(spacing: 14) {
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(
                            LinearGradient(
                                colors: [cyan.opacity(0.25), violet.opacity(0.28)],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .frame(width: 76, height: 76)

                    Image(systemName: "person.crop.square")
                        .font(.system(size: 35, weight: .light))
                        .foregroundStyle(.white.opacity(0.9))
                }

                VStack(alignment: .leading, spacing: 6) {
                    Text("Đỗ Thành Đạt")
                        .font(.system(size: 19, weight: .bold))
                        .foregroundStyle(.white)

                    Text("Independent Developer")
                        .font(.system(size: 12, design: .monospaced))
                        .foregroundStyle(cyan)

                    Text("Luôn học hỏi • Luôn sáng tạo")
                        .font(.system(size: 11))
                        .foregroundStyle(.white.opacity(0.52))
                }
                Spacer(minLength: 0)
            }

            Divider().overlay(.white.opacity(0.08))

            HStack(spacing: 0) {
                statItem(value: "Swift", caption: "LANGUAGE")
                Spacer()
                statItem(value: "iOS", caption: "PLATFORM")
                Spacer()
                statItem(value: "∞", caption: "CURIOSITY")
            }
        }
        .padding(18)
        .background(cardBackground)
        .overlay(RoundedRectangle(cornerRadius: 22).stroke(.white.opacity(0.09), lineWidth: 1))
        .clipShape(RoundedRectangle(cornerRadius: 22))
    }

    private var codeCard: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack(spacing: 6) {
                Circle().fill(Color(red: 1, green: 0.35, blue: 0.35)).frame(width: 7, height: 7)
                Circle().fill(Color(red: 1, green: 0.75, blue: 0.25)).frame(width: 7, height: 7)
                Circle().fill(Color(red: 0.25, green: 0.85, blue: 0.48)).frame(width: 7, height: 7)
                Text("about_me.swift")
                    .font(.system(size: 10, weight: .medium, design: .monospaced))
                    .foregroundStyle(.white.opacity(0.45))
                    .padding(.leading, 5)
                Spacer()
                Image(systemName: "chevron.left.forwardslash.chevron.right")
                    .foregroundStyle(cyan.opacity(0.8))
                    .font(.system(size: 12))
            }
            .padding(.horizontal, 15)
            .padding(.vertical, 13)
            .background(.white.opacity(0.035))

            VStack(alignment: .leading, spacing: 7) {
                codeLine(number: "01", content: [
                    ("struct ", violet), ("ThanhDat", cyan), (": Developer {", .white.opacity(0.8))
                ])
                codeLine(number: "02", content: [
                    ("    let ", violet), ("passion", .white), (" = ", .white.opacity(0.7)), ("\"Building ideas\"", Color.orange)
                ])
                codeLine(number: "03", content: [
                    ("    let ", violet), ("focus", .white), (" = ", .white.opacity(0.7)), ("[\"iOS\", \"Design\"]", Color.orange)
                ])
                codeLine(number: "04", content: [
                    ("    func ", violet), ("create()", cyan), (" { ... }", .white.opacity(0.8))
                ])
                codeLine(number: "05", content: [("}", .white.opacity(0.8))])
            }
            .padding(15)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .background(Color(red: 0.055, green: 0.07, blue: 0.105))
        .overlay(RoundedRectangle(cornerRadius: 18).stroke(cyan.opacity(0.16), lineWidth: 1))
        .clipShape(RoundedRectangle(cornerRadius: 18))
    }

    private var skillsSection: some View {
        VStack(alignment: .leading, spacing: 14) {
            sectionHeading(number: "02", title: "TECH STACK", subtitle: "TOOLS I LIKE")

            VStack(spacing: 12) {
                skillRow(icon: "swift", title: "Swift & SwiftUI", detail: "Native iOS interfaces", progress: 0.82, tint: cyan)
                skillRow(icon: "paintpalette", title: "UI / UX Design", detail: "Clean and intuitive layouts", progress: 0.72, tint: violet)
                skillRow(icon: "hammer", title: "Problem Solving", detail: "Learn, build, improve", progress: 0.76, tint: Color.orange)
            }
            .padding(16)
            .background(cardBackground)
            .overlay(RoundedRectangle(cornerRadius: 20).stroke(.white.opacity(0.08), lineWidth: 1))
            .clipShape(RoundedRectangle(cornerRadius: 20))
        }
    }

    private var projectsContent: some View {
        VStack(alignment: .leading, spacing: 20) {
            sectionHeading(number: "03", title: "SELECTED PROJECTS", subtitle: "IDEAS IN PROGRESS")

            Text("Một vài hướng phát triển và ý tưởng sản phẩm. Hãy thay các thẻ mẫu này bằng dự án thật của bạn.")
                .font(.system(size: 14))
                .lineSpacing(4)
                .foregroundStyle(.white.opacity(0.62))

            projectCard(
                number: "01",
                icon: "iphone",
                title: "iOS App Lab",
                category: "MOBILE DEVELOPMENT",
                description: "Thử nghiệm giao diện SwiftUI, animation và trải nghiệm ứng dụng native.",
                tags: ["SwiftUI", "iOS"]
            )

            projectCard(
                number: "02",
                icon: "chevron.left.forwardslash.chevron.right",
                title: "Developer Tools",
                category: "TOOLS & UTILITIES",
                description: "Các công cụ nhỏ giúp quy trình làm việc nhanh gọn và hiệu quả hơn.",
                tags: ["Tools", "Workflow"]
            )

            projectCard(
                number: "03",
                icon: "sparkles",
                title: "Creative UI",
                category: "DESIGN EXPERIMENTS",
                description: "Khám phá phong cách dark mode, gradient và chuyển động tinh tế.",
                tags: ["UI/UX", "Motion"]
            )
        }
    }

    private var contactContent: some View {
        VStack(alignment: .leading, spacing: 20) {
            sectionHeading(number: "04", title: "LET'S CONNECT", subtitle: "GET IN TOUCH")

            Text("Bạn có ý tưởng hay muốn trao đổi về công nghệ? Hãy cập nhật thông tin liên hệ thật của bạn bên dưới.")
                .font(.system(size: 14))
                .lineSpacing(5)
                .foregroundStyle(.white.opacity(0.62))

            VStack(spacing: 12) {
                contactRow(icon: "envelope.fill", title: "Email", detail: "Thêm email của bạn")
                contactRow(icon: "chevron.left.forwardslash.chevron.right", title: "GitHub", detail: "Thêm username GitHub")
                contactRow(icon: "paperplane.fill", title: "Social", detail: "Thêm liên kết mạng xã hội")
            }
            .padding(16)
            .background(cardBackground)
            .overlay(RoundedRectangle(cornerRadius: 20).stroke(.white.opacity(0.08), lineWidth: 1))
            .clipShape(RoundedRectangle(cornerRadius: 20))

            Button {
                showingContact = true
            } label: {
                HStack {
                    Image(systemName: "pencil")
                    Text("Cập nhật thông tin liên hệ")
                    Spacer()
                    Image(systemName: "arrow.up.right")
                }
                .font(.system(size: 13, weight: .semibold))
                .foregroundStyle(background)
                .padding(16)
                .background(LinearGradient(colors: [cyan, violet], startPoint: .leading, endPoint: .trailing))
                .clipShape(RoundedRectangle(cornerRadius: 15))
            }
            .buttonStyle(.plain)
        }
    }

    private var footer: some View {
        HStack {
            Text("BUILT WITH SWIFTUI")
            Spacer()
            Text("© THANH DAT")
        }
        .font(.system(size: 9, weight: .medium, design: .monospaced))
        .tracking(1)
        .foregroundStyle(.white.opacity(0.3))
        .padding(.top, 4)
    }

    private var bottomNavigation: some View {
        HStack(spacing: 6) {
            tabButton(title: "Tổng quan", icon: "square.grid.2x2.fill", index: 0)
            tabButton(title: "Dự án", icon: "curlybraces", index: 1)
            tabButton(title: "Liên hệ", icon: "paperplane", index: 2)
        }
        .padding(.horizontal, 12)
        .padding(.top, 10)
        .padding(.bottom, 8)
        .background(.ultraThinMaterial)
        .overlay(alignment: .top) {
            Rectangle().fill(.white.opacity(0.08)).frame(height: 1)
        }
    }

    private var cardBackground: some View {
        LinearGradient(
            colors: [
                Color(red: 0.075, green: 0.09, blue: 0.14),
                Color(red: 0.055, green: 0.065, blue: 0.105)
            ],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
    }

    private func statItem(value: String, caption: String) -> some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(value)
                .font(.system(size: 16, weight: .bold, design: .monospaced))
                .foregroundStyle(.white)
            Text(caption)
                .font(.system(size: 8, weight: .medium, design: .monospaced))
                .tracking(1)
                .foregroundStyle(.white.opacity(0.4))
        }
    }

    private func codeLine(number: String, content: [(String, Color)]) -> some View {
        HStack(alignment: .firstTextBaseline, spacing: 12) {
            Text(number)
                .font(.system(size: 10, design: .monospaced))
                .foregroundStyle(.white.opacity(0.25))
                .frame(width: 17, alignment: .trailing)

            HStack(spacing: 0) {
                ForEach(Array(content.enumerated()), id: \.offset) { _, part in
                    Text(part.0).foregroundStyle(part.1)
                }
            }
            .font(.system(size: 11, weight: .medium, design: .monospaced))
            .lineLimit(1)
            .minimumScaleFactor(0.7)
        }
    }

    private func sectionHeading(number: String, title: String, subtitle: String) -> some View {
        VStack(alignment: .leading, spacing: 7) {
            Text("\(number) / \(subtitle)")
                .font(.system(size: 10, weight: .bold, design: .monospaced))
                .tracking(1.6)
                .foregroundStyle(cyan)

            Text(title)
                .font(.system(size: 23, weight: .bold, design: .rounded))
                .foregroundStyle(.white)
        }
        .padding(.top, 10)
    }

    private func skillRow(icon: String, title: String, detail: String, progress: CGFloat, tint: Color) -> some View {
        VStack(alignment: .leading, spacing: 9) {
            HStack(spacing: 10) {
                Image(systemName: icon)
                    .font(.system(size: 15, weight: .semibold))
                    .foregroundStyle(tint)
                    .frame(width: 34, height: 34)
                    .background(tint.opacity(0.12))
                    .clipShape(RoundedRectangle(cornerRadius: 10))

                VStack(alignment: .leading, spacing: 3) {
                    Text(title)
                        .font(.system(size: 13, weight: .semibold))
                        .foregroundStyle(.white)
                    Text(detail)
                        .font(.system(size: 10))
                        .foregroundStyle(.white.opacity(0.45))
                }

                Spacer()
            }

            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    Capsule().fill(.white.opacity(0.07))
                    Capsule()
                        .fill(LinearGradient(colors: [tint, tint.opacity(0.45)], startPoint: .leading, endPoint: .trailing))
                        .frame(width: geometry.size.width * progress)
                }
            }
            .frame(height: 4)
        }
    }

    private func projectCard(number: String, icon: String, title: String, category: String, description: String, tags: [String]) -> some View {
        VStack(alignment: .leading, spacing: 15) {
            HStack {
                Text("PROJECT_\(number)")
                    .font(.system(size: 9, weight: .bold, design: .monospaced))
                    .tracking(1.2)
                    .foregroundStyle(cyan)

                Spacer()

                Image(systemName: "arrow.up.right")
                    .font(.system(size: 12, weight: .semibold))
                    .foregroundStyle(.white.opacity(0.45))
            }

            Image(systemName: icon)
                .font(.system(size: 24, weight: .medium))
                .foregroundStyle(violet)
                .frame(width: 52, height: 52)
                .background(violet.opacity(0.12))
                .clipShape(RoundedRectangle(cornerRadius: 15))

            VStack(alignment: .leading, spacing: 6) {
                Text(category)
                    .font(.system(size: 9, weight: .bold, design: .monospaced))
                    .tracking(1)
                    .foregroundStyle(cyan.opacity(0.85))

                Text(title)
                    .font(.system(size: 18, weight: .bold))
                    .foregroundStyle(.white)

                Text(description)
                    .font(.system(size: 12))
                    .lineSpacing(4)
                    .foregroundStyle(.white.opacity(0.58))
            }

            HStack(spacing: 7) {
                ForEach(tags, id: \.self) { tag in
                    Text(tag)
                        .font(.system(size: 10, weight: .medium, design: .monospaced))
                        .foregroundStyle(.white.opacity(0.75))
                        .padding(.horizontal, 9)
                        .padding(.vertical, 6)
                        .background(.white.opacity(0.06))
                        .clipShape(Capsule())
                }
            }
        }
        .padding(17)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(cardBackground)
        .overlay(RoundedRectangle(cornerRadius: 21).stroke(.white.opacity(0.08), lineWidth: 1))
        .clipShape(RoundedRectangle(cornerRadius: 21))
    }

    private func contactRow(icon: String, title: String, detail: String) -> some View {
        HStack(spacing: 12) {
            Image(systemName: icon)
                .font(.system(size: 14, weight: .semibold))
                .foregroundStyle(cyan)
                .frame(width: 38, height: 38)
                .background(cyan.opacity(0.1))
                .clipShape(RoundedRectangle(cornerRadius: 12))

            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.system(size: 13, weight: .semibold))
                    .foregroundStyle(.white)
                Text(detail)
                    .font(.system(size: 11))
                    .foregroundStyle(.white.opacity(0.45))
            }

            Spacer()

            Image(systemName: "plus")
                .font(.system(size: 12, weight: .bold))
                .foregroundStyle(.white.opacity(0.35))
        }
    }

    private func tabButton(title: String, icon: String, index: Int) -> some View {
        Button {
            withAnimation(.easeInOut(duration: 0.2)) {
                selectedTab = index
            }
        } label: {
            VStack(spacing: 5) {
                Image(systemName: icon)
                    .font(.system(size: 16, weight: .semibold))
                Text(title)
                    .font(.system(size: 10, weight: .medium))
            }
            .foregroundStyle(selectedTab == index ? cyan : .white.opacity(0.42))
            .frame(maxWidth: .infinity)
            .padding(.vertical, 5)
            .contentShape(Rectangle())
        }
        .buttonStyle(.plain)
    }
}
