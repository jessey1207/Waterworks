//
//  GridContentView.swift
//  Waterworks
//
//  Created by Jessey Fung on 17/4/22.
//

import SwiftUI

struct GridContentView: View {
    @ObservedObject var userInput: GridUserInput
    @StateObject var viewModel: ViewModel
    
    init(
        userInput: GridUserInput = .init(),
        isRotated: Bool = false,
        mode: ViewModel.Mode = .edit
    ) {
        self.userInput = userInput
        self._viewModel = .init(
            wrappedValue: .init(
                userInput: userInput,
                isRotated: isRotated,
                mode: mode
            )
        )
    }
    
    var body: some View {
        switch viewModel.mode {
        case .edit:
            ZStack(alignment: .center) {
                Color.custom(.bronzeBackground).opacity(0.25)
                    .edgesIgnoringSafeArea(.bottom)
                gridContent
            }
            .navigationBarItems(trailing: saveButton)
            .onChange(of: userInput.location) { [weak viewModel] _ in
                viewModel?.didUpdateUserInput(userInput)
            }
            .onChange(of: userInput.luck) { [weak viewModel] _ in
                viewModel?.didUpdateUserInput(userInput)
            }
            .onChange(of: userInput.year.number) { [weak viewModel] _ in
                viewModel?.didUpdateUserInput(userInput)
            }
            .sheet(item: $viewModel.sheet) {
                sheet($0)
            }
            .alert(isPresented: $viewModel.isPresentedUnsaveAlert) {
                Alert(
                    title: Text(Constants.Save.Alert.title),
                    message:  Text(viewModel.unsaveAlertMessage),
                    primaryButton: .cancel(Text(Constants.Save.Alert.Buttons.no)),
                    secondaryButton: .destructive(Text(Constants.Save.Alert.Buttons.yes)) {
                        viewModel.unsave()
                    }
                )
            }
        case .view:
            gridContent
        }
    }
}

private extension GridContentView {
    @ViewBuilder
    var gridContent: some View {
        VStack(spacing: 20) {
            PickerView(userInput: userInput)
                .disabled(viewModel.mode != .edit)
            GridView(
                userInput: userInput,
                rotated: $viewModel.isRotated
            )
            actionButtons
            legendView
                .padding(.top, 20)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .scrollInLandscapeMode()
        Image(Constants.Compass.imageName)
            .resizable()
            .scaledToFit()
            .frame(width: Constants.Compass.size, height: Constants.Compass.size)
            .background(Color.white.opacity(0.5))
            .padding(.leading, 10)
            .padding(.bottom, 10)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
    }
    
    @ViewBuilder
    var saveButton: some View {
        Button {
            withAnimation { [weak viewModel] in
                viewModel?.didTapSaveButton(userInput: userInput)
            }
        } label: {
            Image(systemName: viewModel.saveButtonImageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: Constants.Save.Button.size, height: Constants.Save.Button.size)
                .padding(.top, Constants.Save.Button.padding)
        }
    }
    
    var actionButtons: some View {
        HStack(spacing: 40) {
            RotateButton(
                userInput: userInput,
                rotated: $viewModel.isRotated
            )
            Button(action: {
                userInput.isAdding.toggle()
            }) {
                Text(userInput.isAdding ? Constants.Buttons.doNotAdd : Constants.Buttons.add)
                    .font(.title)
            }
        }
        .disabled(userInput.isInvalid)
        .animation(.linear(duration: 0.2), value: userInput.isAdding)
    }
    
    var legendView: some View {
        HStack(spacing: 25) {
            Text(Constants.Grid.Item.yearText)
                .foregroundColor(.black)
            legendItem(icon: Constants.Grid.Item.evilTextIcon, text: Constants.Grid.Item.evilText)
            legendItem(icon: Constants.Grid.Item.ageTextIcon, text: Constants.Grid.Item.ageText)
            legendItem(icon: Constants.Grid.Item.strengthIcon, text: Constants.Grid.Item.strengthText)
        }
        .font(.custom(.bodySecondary))
        .foregroundColor(.custom(.brownPrimary))
    }
    
    func legendItem(icon: String, text: String) -> some View {
        HStack(spacing: 4) {
            Text(icon)
                .font(.custom(.control))
            Text(text)
        }
    }
    
    @ViewBuilder
    private func sheet(_ sheet: ViewModel.Sheet) -> some View {
        switch sheet {
        case .save:
            SaveGridContentModal(
                gridUserInput: userInput,
                onSaveAction: { [weak viewModel] name, location, placeName, notes, gridUserInput in
                    viewModel?.save(
                        configuration: .init(
                            name: name,
                            userInput: gridUserInput,
                            location: location,
                            placeName: placeName,
                            notes: notes
                        )
                    )
                },
                onDismissAction: { [weak viewModel] in
                    viewModel?.sheet = nil
                }
            )
        }
    }
}

struct GridContentView_Previews: PreviewProvider {
    static var previews: some View {
        GridContentView()
            .previewLayout(.fixed(width: 568, height: 320))
            .previewDisplayName("Grid-light")
        GridContentView()
            .preferredColorScheme(.dark)
            .previewDisplayName("Grid-dark")
    }
}
